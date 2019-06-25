//
//  SearchMainViewController.h
//  ObjectCWork
//
//  Created by 姜旦旦 on 2019/6/22.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITunesProvider.h"
#import "SearchMainTableViewCell.h"
#import "UserStatusSingleton.h"

@interface SearchMainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)searchButtonAction:(id)sender;

@end
