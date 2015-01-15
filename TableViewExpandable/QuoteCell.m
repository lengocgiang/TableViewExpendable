//
//  QuoteCell.m
//  TableViewExpandable
//
//  Created by Le Ngoc Giang on 1/15/15.
//  Copyright (c) 2015 giangle. All rights reserved.
//

#import "QuoteCell.h"
#import "Quotation.h"
#import "HighlightTextView.h"

@implementation QuoteCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setQuotation:(Quotation *)newQuotation
{
    if (_quotation != newQuotation) {
        _quotation = newQuotation;
        
        self.characterLabel.text = _quotation.character;
        self.actAndSceneLabel.text = [NSString stringWithFormat:@"Act %d, Scene %d",_quotation.act,_quotation.scene];
        self.quotationTextView.text = _quotation.quotations;
        
    }
}

@end
