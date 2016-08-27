//
//  HistoryViewController.m
//  Machismo
//
//  Created by Daniel Springer on 8/17/15.
//  Copyright (c) 2015 Daniel Springer. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

@implementation HistoryViewController


/*
- (UITextView *) usedCards
{
    if (!_historyTextView) _historyTextView = [[UITextView alloc] init];
    return _historyTextView;
    
}

*/
-(void)updateUI
{
    NSMutableAttributedString *lineBreak = [[NSMutableAttributedString alloc] initWithString:@"\n" attributes:nil];
    NSMutableAttributedString *historyString = [[NSMutableAttributedString alloc] init];
    for (NSAttributedString *card in _history) {
        [historyString appendAttributedString:card];
        [historyString appendAttributedString:lineBreak];
    }
    self.historyTextView.attributedText = historyString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}

@end
