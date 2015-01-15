//
//  HighlightTextView.m
//  TableViewExpandable
//
//  Created by Le Ngoc Giang on 1/15/15.
//  Copyright (c) 2015 giangle. All rights reserved.
//

#import "HighlightTextView.h"

@implementation HighlightTextView

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted != _highlighted) {
        self.textColor = highlighted ? [UIColor whiteColor] : [UIColor blackColor];
        _highlighted = highlighted;
    }
}

@end
