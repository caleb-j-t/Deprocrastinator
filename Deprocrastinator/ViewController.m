//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Caleb Talbot on 5/31/16.
//  Copyright © 2016 Caleb Talbot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray <NSMutableAttributedString *> *toDoItems;
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = [NSMutableArray arrayWithObjects:
                      [[NSMutableAttributedString alloc] initWithString: @"Take the dog out"],
                      [[NSMutableAttributedString alloc] initWithString: @"Finish my afternoon challenge"],
                      [[NSMutableAttributedString alloc] initWithString: @"Drink Tequila"],
                      [[NSMutableAttributedString alloc] initWithString: @"Call Mom"], nil];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    // cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.toDoItems objectAtIndex:indexPath.row]];
    
    cell.textLabel.attributedText = [self.toDoItems objectAtIndex:indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoItems.count;
}

- (IBAction)addButtonPressed:(UIBarButtonItem *)sender {
    // [self.toDoItems addObject:[NSString stringWithFormat:@"%@",self.taskTextField.text]];
    NSMutableAttributedString *textFieldText = [[NSMutableAttributedString alloc] initWithString: self.taskTextField.text];
    [self.toDoItems addObject: textFieldText];
    [self.tableView reloadData];
    [self.taskTextField resignFirstResponder];
    
    // Clears the task after you add a task - really sets the textfield text to nothing
    self.taskTextField.text = @"";
    
}

@end
