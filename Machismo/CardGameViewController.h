//
//  CardGameViewController.h
//  Machismo
//
//  Created by Daniel Springer on 12/27/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//
//Abstract class must implement methods as stated below

#import <UIKit/UIKit.h>
#import "Deck.h"
@interface CardGameViewController : UIViewController
//Protected

- (Deck *)createDeck; //Abstract
- (void)updateUI;


@end
