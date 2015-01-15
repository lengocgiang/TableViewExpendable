//
//  QuoteCell.h
//  TableViewExpandable
//
//  Created by Le Ngoc Giang on 1/15/15.
//  Copyright (c) 2015 giangle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighlightTextView.h"

@class Quotation;

@interface QuoteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *characterLabel;
@property (weak, nonatomic) IBOutlet UILabel *actAndSceneLabel;
@property (weak, nonatomic) IBOutlet HighlightTextView *quotationTextView;

@property (strong, nonatomic) Quotation *quotation;

@property (nonatomic) UILongPressGestureRecognizer *longPressRecognizer;

@end
