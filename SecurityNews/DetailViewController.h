//
//  DetailViewController.h
//  SecurityNews
//
//  Created by Zobair on 11/21/14.
//  Copyright (c) 2014 littleBigCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

