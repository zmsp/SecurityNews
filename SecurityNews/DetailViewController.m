//
//  DetailViewController.m
//  SecurityNews
//
//  Created by Zobair on 11/21/14.
//  Copyright (c) 2014 littleBigCoder. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UINavigationItem *detailTitle;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        
        
        NSDictionary *singleNews = self.detailItem;

        
        self.detailTitle.title = [singleNews valueForKey:@"Title"];
        
        
        NSString *urlString = [singleNews valueForKey:@"URL"];
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.newsBrowser loadRequest:request];
         
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
