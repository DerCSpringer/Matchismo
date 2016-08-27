//
//  PlayingCardGameViewController.m
//  Machismo
//
//  Created by Daniel Springer on 7/8/15.
//  Copyright (c) 2015 Daniel Springer. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}




@end
