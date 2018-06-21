//
//  ViewController.m
//  coreData
//
//  Created by Mayur Kumbhar on 01/06/18.
//  Copyright © 2018 Mayur Kumbhar. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;

    self.itemNameArray = [[NSMutableArray alloc]init];
    self.itemRateArray = [[NSMutableArray alloc]init];

    [self fetch];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    self.itemNameArray = [[NSMutableArray alloc]init];
    self.itemRateArray = [[NSMutableArray alloc]init];

    [self fetch];
}

-(void)fetch
{
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=delegate.persistentContainer.viewContext;
    NSError *error;
    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"Item" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    self.itemObjects =[context executeFetchRequest:request error:&error];
    if(self.itemObjects.count >0)
    {
        self.itemNameArray=[self.itemObjects valueForKey:@"itemName"];
        self.itemRateArray=[self.itemObjects valueForKey:@"itemRate"];
    }
    [self.myTableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemNameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.itemNameArray objectAtIndex:indexPath.row];
    id rate = [self.itemRateArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",rate];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(UIBarButtonItem *)sender {
    NextViewController *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    [self.navigationController pushViewController:nvc animated:YES];
  // [self.navigationController popToViewController:nvc animated:YES];
}
@end
