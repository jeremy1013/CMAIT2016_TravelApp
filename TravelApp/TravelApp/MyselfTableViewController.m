;//
//  MyselfTableViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/3.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "MyselfTableViewController.h"


@interface MyselfTableViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UIButton *accountLogin;

@property (weak, nonatomic) IBOutlet UIImageView *myPostImageView;
@property (weak, nonatomic) IBOutlet UIImageView *myLaunchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteActivitiesImageView;
@property (weak, nonatomic) IBOutlet UIImageView *wipeCacheImageView;
@property (weak, nonatomic) IBOutlet UIImageView *feedbackImageView;
@property (weak, nonatomic) IBOutlet UIImageView *aboutOursImageView;

@end

@implementation MyselfTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"myselfTableViewController");
    
    //self.tableView.delegate = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self makeForUI];
    
    
    
    
    
    
}


#pragma mark --makrUI
- (void) makeForUI {
    self.accountLogin.layer.cornerRadius = 5.0f;
    self.accountLogin.layer.masksToBounds = YES;
    self.accountLogin.layer.borderWidth = 1.0f;
    self.accountLogin.layer.borderColor = TRAVEL_BROWN_COLOR.CGColor;

    self.userIcon.image = [UIImage imageNamed:@"userIcon"];
    self.userIcon.layer.cornerRadius = self.userIcon.layer.frame.size.width / 2.0;
    self.userIcon.layer.masksToBounds = YES;
    
    
    float boundsRadius = self.myPostImageView.layer.frame.size.width / 2.0;
    
    self.myPostImageView.image = [UIImage imageNamed:@"myPost"];
    self.myPostImageView.layer.cornerRadius = boundsRadius;
    self.myPostImageView.layer.masksToBounds = YES;
    
    self.myLaunchImageView.image = [UIImage imageNamed:@"myLaunch"];
    self.myLaunchImageView.layer.cornerRadius = boundsRadius;
    self.myLaunchImageView.layer.masksToBounds = YES;
    
    self.favoriteActivitiesImageView.image = [UIImage imageNamed:@"favoriteActivities"];
    self.favoriteActivitiesImageView.layer.cornerRadius = boundsRadius;
    self.favoriteActivitiesImageView.layer.masksToBounds = YES;
    
    self.wipeCacheImageView.image = [UIImage imageNamed:@"wipeCache"];
    self.wipeCacheImageView.layer.cornerRadius = boundsRadius;
    self.wipeCacheImageView.layer.masksToBounds = YES;
    
    self.feedbackImageView.image = [UIImage imageNamed:@"feedback"];
    self.feedbackImageView.layer.cornerRadius = boundsRadius;
    self.feedbackImageView.layer.masksToBounds = YES;
    
    self.aboutOursImageView.image = [UIImage imageNamed:@"aboutOurs"];
    self.aboutOursImageView.layer.cornerRadius = boundsRadius;
    self.aboutOursImageView.layer.masksToBounds = YES;
    

}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



/*
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSLog(@"80");
        return 80;
        
    }else{
        NSLog(@"40");
        return 40;
    }
    
}
*/

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.0f;
    }else {
        return 20.0f;
    }
}


@end
