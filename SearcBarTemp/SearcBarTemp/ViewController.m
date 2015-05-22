//
//  ViewController.m
//  SearcBarTemp
//
//  Created by zhoupingshuang on 15/5/22.
//  Copyright (c) 2015年 Hangzhou Badian Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic)UIView *v;
@property(strong,nonatomic)UISearchBar *searchBar;
@property(strong,nonatomic)UITableView *tableview;

@property(strong,nonatomic)UIView *boundv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:self.v];
    self.v.backgroundColor = [UIColor blackColor];
    
    UILabel *titlelbl = [[UILabel alloc]init];
    titlelbl.font = [UIFont systemFontOfSize:17.0f];
    titlelbl.textColor = [UIColor whiteColor];
    titlelbl.textAlignment = NSTextAlignmentCenter;
    titlelbl.text = @"测试searchBar";
    CGSize size = [titlelbl.text sizeWithAttributes:@{NSFontAttributeName:titlelbl.font}];
    titlelbl.frame = CGRectMake(0, 0, size.width, size.height);
    titlelbl.center = CGPointMake(self.view.frame.size.width/2, 20+44/2);
    [self.v addSubview:titlelbl];
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, self.v.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.searchBar.placeholder = @"搜索";
    self.searchBar.showsCancelButton = NO;
    self.tableview.tableHeaderView = self.searchBar;
    self.searchBar.delegate = self;
    
    self.boundv = [[UIView alloc]initWithFrame:CGRectMake(0, 64+44, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.boundv.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.boundv];
    self.boundv.hidden = YES;
    UILabel *lblt = [[UILabel alloc]init];
    lblt.font = [UIFont systemFontOfSize:15.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc]init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    
    CGRect rect = self.view.frame;
    CGRect rect1 = self.v.frame;
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        self.v.frame = CGRectMake(0, 0, rect1.size.width, rect1.size.height);
        self.boundv.hidden = YES;
        self.searchBar.showsCancelButton = NO;
    } completion:^(BOOL finished) {
        
    }];

}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"searchBarShouldBeginEditing");
    
    CGRect rect = self.view.frame;
    CGRect rect1 = self.v.frame;
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = CGRectMake(0, -44, rect.size.width, rect.size.height);
        self.v.frame = CGRectMake(0, -20, rect1.size.width, rect1.size.height);
        self.boundv.hidden = NO;
        self.searchBar.showsCancelButton = YES;
    } completion:^(BOOL finished) {
        
    }];
    
    return YES;
}

@end
