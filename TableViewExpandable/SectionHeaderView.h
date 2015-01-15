//
//  SectionHeaderView.h
//  TableViewExpandable
//
//  Created by Le Ngoc Giang on 1/15/15.
//  Copyright (c) 2015 giangle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SectionHeaderView;

@protocol SectionHeaderViewDelegate <NSObject>

@optional
- (void)sectionHeaderView:(SectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)section;
- (void)sectionHeaderView:(SectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)section;

@end

@interface SectionHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *disclosureButton;

@property (weak, nonatomic) id<SectionHeaderViewDelegate> delegate;
@property (nonatomic) NSInteger section;

- (void)toggleOpenWithUserAction:(BOOL)userAction;

@end
