//
//  MasterViewController.h
//  SecurityNews
//
//  Created by Zobair on 11/21/14.
//  Copyright (c) 2014 littleBigCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController
@property (nonatomic, retain) NSArray *newsNames;
@property (nonatomic, retain) NSArray *newsAddresses;

@property (strong, nonatomic) NSMutableArray *newsArray;

@end

