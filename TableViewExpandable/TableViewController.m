//
//  TableViewController.m
//  TableViewExpandable
//
//  Created by Le Ngoc Giang on 1/15/15.
//  Copyright (c) 2015 giangle. All rights reserved.
//

#import "TableViewController.h"
#import "QuoteCell.h"

@interface TableViewController ()
@property (strong, nonatomic) NSArray *firstArray;
@property (strong, nonatomic) NSMutableArray *firstForTable;

-(void)miniMizeFirstsRows:(NSArray*)ar;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dTmp = [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"first" ofType:@"plist"]];
    
    self.firstArray = [dTmp valueForKey:@"Object"];
    
    self.firstForTable = [[NSMutableArray alloc]init];
    [self.firstForTable addObject:self.firstArray];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"QuoteCellIdentifier";
    
    QuoteCell *cell = (QuoteCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.characterLabel.text = @"Giang";
    
    
    return cell;
}

@end