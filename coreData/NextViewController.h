//
//  NextViewController.h
//  coreData
//
//  Created by Mayur Kumbhar on 01/06/18.
//  Copyright © 2018 Mayur Kumbhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"
@interface NextViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameText;
- (IBAction)deleteButton:(UIButton *)sender;
- (IBAction)updateButton:(UIButton *)sender;
- (IBAction)insertButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *rateText;
@end
