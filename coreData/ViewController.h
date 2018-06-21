//
//  ViewController.h
//  coreData
//
//  Created by Mayur Kumbhar on 01/06/18.
//  Copyright © 2018 Mayur Kumbhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NextViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *itemObjects;
@property NSMutableArray *itemNameArray,*itemRateArray;
- (IBAction)next:(UIBarButtonItem *)sender;

@end

