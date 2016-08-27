//
//  SetGameViewController.m
//  Machismo
//
//  Created by Daniel Springer on 8/4/15.
//  Copyright (c) 2015 Daniel Springer. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetDeck.h"
#import "SetCard.h"
#import "CardMatchingGame.h"


@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (Deck *)createDeck
{
    return [[SetDeck alloc] init];
}

/*- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
*/

- (IBAction)doSomething:(id)sender {
    
    Deck *deck = [[SetDeck alloc] init];
    /*
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [items addObject:deck.drawRandomCard];
    [items addObject:deck.drawRandomCard];
    [items addObject:deck.drawRandomCard];
    */
    
    NSLog(@"%@", [self titleForCard:deck.drawRandomCard]);
    
    //SetCard *card = deck.drawRandomCard;
    //NSLog(@"%@", [card color]);

    //NSLog(@"%d", [items[1] match:items]);
    
    //items = nil;
    
    //[items[1] match:items];



}

- (NSMutableAttributedString *)titleForCard:(id)card
{
    NSString *tempTitle = [[NSString alloc] init];
    //= [[NSString alloc] initWithString:[card shape]];
    if ([card isKindOfClass:[SetCard class]]) {
        SetCard *card = card;
    }
   // SetCard *setCard = (SetCard)card;
    
    double shade = 0.1;
    double empty = 0.0;
    

     
    NSDictionary *colorDict = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor greenColor], @"green", [UIColor purpleColor], @"purple", [UIColor redColor], @"red", [[UIColor greenColor] colorWithAlphaComponent:empty], @"emptygreen", [[UIColor purpleColor] colorWithAlphaComponent:empty], @"emptypurple", [[UIColor redColor] colorWithAlphaComponent:empty], @"emptyred", [[UIColor greenColor] colorWithAlphaComponent:shade], @"shadedgreen", [[UIColor purpleColor] colorWithAlphaComponent:shade], @"shadedpurple", [[UIColor redColor] colorWithAlphaComponent:shade], @"shadedred", nil];
    
    /*
    NSDictionary *shadeDict = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor greenColor], @"green", [UIColor purpleColor], @"purple", [UIColor redColor], @"red", nil];
    
    UIColor *tPurple = [[UIColor purpleColor] colorWithAlphaComponent:0.3];
    UIColor *tRed = [[UIColor redColor] colorWithAlphaComponent:0.3];
    UIColor *tGreen = [[UIColor greenColor] colorWithAlphaComponent:0.3];

    
    [card shape];
    
     */
    
    //[colorDict obj]
    NSString *shadingAndColor = [card shade];
    
    shadingAndColor = [shadingAndColor stringByAppendingString:[card color]];
    
    //[tempTitle string]
    for (int i = 0; i < [[card number] intValue]; i++) {
        tempTitle = [tempTitle stringByAppendingString:[card shape]];
    }
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:tempTitle];
    
    [title setAttributes:@{NSForegroundColorAttributeName: [colorDict objectForKey:shadingAndColor], NSStrokeWidthAttributeName: @-5, NSStrokeColorAttributeName: [colorDict objectForKey:[card color]]} range:(NSMakeRange(0, [tempTitle length]))];
    //NSLog(@"%@", title.description);
    
    return title;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.chosen ? @"setCardSelected" : @"cardfront"];
}
/*

- (NSString *)cardTitle
{
    
    _dict = [_test attributesAtIndex:0 effectiveRange:NULL];
    
    colorDict = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor greenColor], @"green", [UIColor purpleColor], @"purple", [UIColor redColor], @"red", nil];
    UIColor *green = [UIColor greenColor];
    UIColor *tGreen = [[UIColor greenColor] colorWithAlphaComponent:0.3];
    UIColor *red = [UIColor redColor];
    UIColor *tRed = [[UIColor redColor] colorWithAlphaComponent:0.3];
    UIColor *purple = [UIColor purpleColor];
    UIColor *tPurple = [[UIColor purpleColor] colorWithAlphaComponent:0.3];
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            
        }
        
    }
    
    return nil;
}
 */

- (void)updateUI
{
    [super updateUI];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}


@end
