//
//  SectionHeaderView.m
//  TableViewExpandable
//
//  Created by Le Ngoc Giang on 1/15/15.
//  Copyright (c) 2015 giangle. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView

- (void)awakeFromNib
{
    [self.disclosureButton setImage:[UIImage imageNamed:@"carat-open"] forState:UIControlStateSelected];
    
    // set up the tap gesture recognizer
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toggleAction:)];
    
    [self addGestureRecognizer:tapRecognizer];
}

- (IBAction)toggleAction:(id)sender
{
    [self toggleOpenWithUserAction:YES];
}

- (void)toggleOpenWithUserAction:(BOOL)userAction
{
    // toggle the disclosure button state
    self.disclosureButton.selected = !self.disclosureButton.self;
    
    // if it was a user action, send the delegate the approxiate message
    if (userAction)
    {
        if (self.disclosureButton.selected)
        {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)])
            {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
        else
        {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
    }
}


@end
