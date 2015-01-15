//
//  TableViewController.m
//  TableViewExpandable
//
//  Created by Le Ngoc Giang on 1/15/15.
//  Copyright (c) 2015 giangle. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCell.h"

@interface TableViewController ()
@property (strong, nonatomic) NSArray *firstArray;
@property (strong, nonatomic) NSMutableArray *firstForTable;

-(void)miniMizeFirstsRows:(NSArray*)ar;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dTmp = [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"first" ofType:@"plist"]];
    
    self.firstArray = [dTmp valueForKey:@"Objects"];
    
    self.firstForTable = [[NSMutableArray alloc]init];
    [self.firstForTable addObjectsFromArray:self.firstArray];
    
    
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
    return [self.firstForTable count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[[self.firstForTable objectAtIndex:indexPath.row]valueForKey:@"name"]];
    [cell setIndentationLevel:[[[self.firstForTable objectAtIndex:indexPath.row] valueForKey:@"level"] intValue]];


    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *d = [self.firstForTable objectAtIndex:indexPath.row];
    if ([d valueForKey:@"Objects"]) {

        NSArray *ar = [d valueForKey:@"Objects"];
        
        BOOL isAlreadyInserted = NO;
        
        for (NSDictionary *dInner in ar) {
            NSInteger index = [self.firstForTable indexOfObjectIdenticalTo:dInner];
            isAlreadyInserted =(index > 0 && index != NSIntegerMax);
            if (isAlreadyInserted) {
                break;
            }
        }
        if (isAlreadyInserted) {
            [self miniMizeFirstsRows:ar];
        }
        else
        {
            NSUInteger count = indexPath.row + 1;
            NSMutableArray *arCells = [NSMutableArray array];
            for (NSDictionary *dInner in ar) {
                [arCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                [self.firstForTable insertObject:dInner atIndex:count++];
            }
            [tableView insertRowsAtIndexPaths:arCells withRowAnimation:UITableViewRowAnimationFade];
        }
    }
    else
    {
        NSLog(@"Leave Element:::%@ %@|",[d valueForKey:@"name"],[d valueForKey:@"book"]);
    }
}

- (void)miniMizeFirstsRows:(NSArray *)ar
{
    for(NSDictionary *dInner in ar ) {
        NSUInteger indexToRemove=[self.firstForTable indexOfObjectIdenticalTo:dInner];
        NSArray *arInner=[dInner valueForKey:@"Objects"];
        if(arInner && [arInner count]>0){
            [self miniMizeFirstsRows:arInner];
        }
        
        if([self.firstForTable indexOfObjectIdenticalTo:dInner]!=NSNotFound) {
            [self.firstForTable removeObjectIdenticalTo:dInner];
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:
                                                    [NSIndexPath indexPathForRow:indexToRemove inSection:0]
                                                    ]
                                  withRowAnimation:UITableViewRowAnimationFade];
        }
    }

}
@end