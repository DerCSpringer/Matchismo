//
//  CardGameViewController.m
//  Machismo
//
//  Created by Daniel Springer on 12/27/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *reset;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchSelection;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (strong, nonatomic) NSMutableArray *historyResults;
@property (strong, nonatomic) NSMutableArray *usedCards;
@end

@implementation CardGameViewController

- (NSMutableArray *) historyResults
{
    if (!_historyResults) _historyResults = [[NSMutableArray alloc] init];
    return _historyResults;
    
}

- (NSMutableArray *) usedCards
{
    if (!_usedCards) _usedCards = [[NSMutableArray alloc] init];
    return _usedCards;
    
}



- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
        
}

- (Deck *)createDeck //Abstract
{
    return nil;
}



- (IBAction)touchCardButton:(UIButton *)sender {
    [self.matchSelection setEnabled:NO];
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)touchResetbutton:(UIButton *)sender
{
    self.game = nil;
    [self.matchSelection setEnabled:YES];
    [self updateUI];
    self.historyResults = nil;
    
}

- (IBAction)gameType:(id)sender {
    
    [self.matchSelection selectedSegmentIndex];
    //NSLog([NSString stringWithFormat:@"setting %d", [self.matchSelection selectedSegmentIndex]]);
    
    self.game.matchType = [self.matchSelection selectedSegmentIndex];
    
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        //self.resultsLabel.text = self.game.cardsInResultsString;
        //[historyLabel setAttributedString:[self history]];
        //self.resultsLabel.attributedText = historyLabel;
    }
    [self history];
   // for (NSAttributedString *title in self.historyResults) {
   //     self.resultsLabel.attributedText = title;
    //}
   // NSLog(@"%@", self.historyResults.description);

}


- (void)history
{
    //Shows the history for the Card Game
    //Chosen count is used to check if 3 cards have been chosen.

    int chosenCount = 0;
    NSMutableAttributedString *cardTitle = [[NSMutableAttributedString alloc] init];
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        if (card.isChosen && !card.isMatched) {
            [cardTitle appendAttributedString:[self titleForCard:card]];
            chosenCount++;
        }
        if (card.isMatched && ![self.historyResults containsObject:[self titleForCard:card]]) {
            [self.historyResults addObject:[self titleForCard:card]];
        }
        
    }
    if (chosenCount == 0) {
        if (self.game.lastScore < 0) {
            [cardTitle appendAttributedString:[self matchedOrUnmatchedCards:self.game.lastCards]];
            [[cardTitle mutableString] appendFormat:@" Don't match %d points", self.game.lastScore];
        }
        if (self.game.lastScore > 0) {
            [cardTitle appendAttributedString:[self matchedOrUnmatchedCards:self.game.lastCards]];
            [[cardTitle mutableString] appendFormat:@" Match you gain %d points", self.game.lastScore];
        }
    }
    [self.historyResults addObject:cardTitle];
}

- (NSAttributedString *)matchedOrUnmatchedCards:(NSMutableArray *)cards
{
    //Returns cards if three are matched and unchosen in the model
    NSMutableAttributedString *matchedOrUnmatchedCardsString = [[NSMutableAttributedString alloc] init];
    for (Card *matchedCard in cards) {
        matchedCard.chosen = YES;
        [matchedOrUnmatchedCardsString appendAttributedString:[self titleForCard:matchedCard]];
        matchedCard.chosen = NO;
        //I do this stupid yes/no thing so it will work nice with titleForCard.  It won't work otherwise.
    }
    return matchedOrUnmatchedCardsString;
}


- (NSAttributedString *)titleForCard:(Card *)card
{
  
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:card.chosen ? card.contents : @""];
    return title;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@"%@", segue.identifier);
    if([segue.identifier isEqualToString:@"PlayingCard History"] || [segue.identifier isEqualToString:@"SetCard History"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *hvc = (HistoryViewController *)segue.destinationViewController;
            hvc.history = self.historyResults;

        }
    }
}


@end