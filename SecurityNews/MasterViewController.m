//
//  MasterViewController.m
//  SecurityNews
//
//  Created by Zobair on 11/21/14.
//  Copyright (c) 2014 littleBigCoder. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://mason.gmu.edu/~mshahada/Data/SecurityNews"];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    NSLog(@"The value of jsonData is %@",jsonData);
    if(jsonData != nil)
    {
        NSError *error = nil;
        NSDictionary *dataDictionary =
        [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        
        
        NSLog(@"%@",dataDictionary);
        NSLog(@"Count of items %lu",(unsigned long)dataDictionary.count);
        
        //Added this line...
        self.newsArray = [dataDictionary objectForKey:@"News"];
        
        NSLog(@"College Name array%@",self.newsArray);
    }
    
    /*
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    */
    _newsNames = [[NSArray alloc] initWithObjects:@"CNET Security News", @"Google", @"SecurityWeek", @"Threat Post", nil];
    _newsAddresses = [[NSArray alloc] initWithObjects:@"http://www.cnet.com/topics/security/", @"https://www.google.com/search?q=cnet+security+news&oq=cnet+security+news&aqs=chrome..69i57.2736j0j4&sourceid=chrome&es_sm=91&ie=UTF-8#q=security+news&tbm=nws", @"http://feeds.feedburner.com/securityweek", @"http://threatpost.com/", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    //Holds data
    //NSArray *myData = [[NSArray alloc] initWithObjects: _newsNames[indexPath.row], _newsAddresses[indexPath.row], nil];
    
    
    
    NSDictionary *singleNews =[self.newsArray objectAtIndex:indexPath.row];
    
    //NSString *string = [singleCollege valueForKey:@"UniversityURL"];
    //NSString *image= [singleCollege valueForKey:@"UniversityImageURL"];
    
    
    
    [[segue destinationViewController] setDetailItem:singleNews];
    

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //Count of ROW
    
    return self.newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    
    NSDictionary *singleNews =[self.newsArray objectAtIndex:indexPath.row];
    NSLog(@"Single College%@", singleNews);
    
    
    cell.textLabel.text = [singleNews valueForKey:@"Title"];
    
    cell.detailTextLabel.text = [singleNews valueForKey:@"Detail"];
    //cell.imageView setImage:[UIImage imageNamed:(imageURL)];
    NSString *imageName = [singleNews valueForKey:@"Icon"];
    
    NSString *imageURL;
    if ([imageName isEqualToString:@"google.png"]) {
        imageURL =@"google.png";
    } else if ([imageName isEqualToString:@"cnet.png"]) {
        imageURL =@"cnet.png";
    } else if ([imageName isEqualToString:@"threat.png"]) {
        imageURL =@"threat.png";
    } else if ([imageName isEqualToString:@"security.png"]) {
        imageURL =@"security.png";
        
    } else {
        imageURL =@"default.png";
    }
    //[self.displayImage setImage:[UIImage imageNamed:(imageURL)]];
    
    [cell.imageView setImage:[UIImage imageNamed:(imageURL)]];
   
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    
     */

}


@end
