//
//  NextViewController.m
//  coreData
//
//  Created by Mayur Kumbhar on 01/06/18.
//  Copyright © 2018 Mayur Kumbhar. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)insertObject
{
    NSError *error;
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context= delegate.persistentContainer.viewContext;
    NSManagedObject *Object=[NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:context];
    [Object setValue:self.nameText.text forKey:@"itemName"];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:self.rateText.text];
    [Object setValue:myNumber forKey:@"itemRate"];
    [context save:&error];
    self.nameText.text=@"";
    self.rateText.text=@"";
}

-(void)updateObject
{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    NSPredicate *namePredicate=[NSPredicate predicateWithFormat:@"(itemName contains[cd] %@)",self.nameText.text];
    NSError *error;
    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"Item" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    [request setPredicate:namePredicate];
    NSArray *allObjects=[context executeFetchRequest:request error:&error];
    if(allObjects.count==1)
    {
        NSManagedObject  *myobject=[allObjects firstObject];
        NSString *name,*rate;
        name=self.nameText.text;
        rate=self.rateText.text;
        NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
        f.numberStyle=NSNumberFormatterDecimalStyle;
        NSNumber *myNumber= [f numberFromString: self.rateText.text];
        [myobject setValue:myNumber forKey:@"itemRate"];
        [context save:&error];
    }
    else
    {
        NSLog(@"Update Failed...");
    }
}

-(void)deleteObject
{
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context= delegate.persistentContainer.viewContext;
    NSPredicate *namePredicate=[NSPredicate predicateWithFormat:@"(itemName contains[cd] %@)",self.nameText.text];
    NSError *error;
    NSManagedObject *myobject;
    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"Item" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    [request setPredicate:namePredicate];
    NSArray *allObjects=[context executeFetchRequest:request error:&error];
    if(allObjects.count>=1)
    {
        myobject=[allObjects firstObject];
        [context deleteObject:myobject];
        [context save:&error];
    }
    else
    {
        NSLog(@"Delete Failed...");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)insertButton:(id)sender {
    [self insertObject];
    NSLog(@"Insert Success");
}

- (IBAction)deleteButton:(id)sender {
    [self deleteObject];
    NSLog(@"Delete Success");
}

- (IBAction)updateButton:(UIButton *)sender {
    [self updateObject];
    NSLog(@"Update Success");


}
@end
