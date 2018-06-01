//
//  AppDelegate.h
//  coreData
//
//  Created by Mayur Kumbhar on 01/06/18.
//  Copyright © 2018 Mayur Kumbhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

