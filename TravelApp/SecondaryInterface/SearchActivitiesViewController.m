//
//  SearchActivitiesViewController.m
//  TravelApp
//
//  Created by Jeremy on 2016/10/7.
//  Copyright © 2016年 Jeremy. All rights reserved.
//

#import "SearchActivitiesViewController.h"



@interface SearchActivitiesViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar * searchBar;


@end

@implementation SearchActivitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 5, 355.0f, 35)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索活动";
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.tintColor = [UIColor whiteColor];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.showsSearchResultsButton = YES;
    
    
//    UIView * searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
//    searchView.backgroundColor = [UIColor clearColor];
//    [searchView addSubview:self.searchBar];
//    [self.navigationController.navigationBar addSubview:searchView];
    
    
    
    
    [self.navigationController.navigationBar addSubview:_searchBar];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UISearchBarDelegate
- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar { 
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] > 20) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:@"字数不能超过20" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        [self.searchBar setText:[searchText substringToIndex:20]];
    }
}


- (void) searchBarResultsListButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"2");
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end



