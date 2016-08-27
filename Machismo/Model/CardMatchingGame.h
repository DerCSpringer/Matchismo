//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Daniel Springer on 2/17/15.
//  Copyright (c) 2015 Daniel Springer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "PlayingCard.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)chooseButtonMatchType:(NSUInteger)matchType;

@property (nonatomic, readonly) NSUInteger score;
@property (nonatomic) NSUInteger matchType;
@property (nonatomic, readonly) NSMutableString *cardsInResultsString;
@property (nonatomic, readonly) int lastScore;
@property (strong, nonatomic, readonly) NSMutableArray *lastCards;


@end
