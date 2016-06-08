//
//  ViewController.m
//  LTTableViewDemo
//
//  Created by 李涛 on 16/6/7.
//  Copyright © 2016年 李涛. All rights reserved.
//

#import "ViewController.h"
#import "LTTableView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet LTTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* dataSource = @[@[@"1",@"2",@"3"],@[@"a",@"b",@"c"],@[@"@",@"#"]];
    
    // Do any additional setup after loading the view, typically from a nib.
    _tableView
    .lt_registered_cell(@[[UITableViewCell class]])//注册cell
    .lt_section(3)//分区
    .lt_row(^NSInteger(NSInteger section){
        NSArray* ary = dataSource[section];
        return ary.count;//每个区多少row
    })
    .lt_cell(^UITableViewCell*(NSIndexPath* index){
        NSArray* ary = dataSource[index.section];
        UITableViewCell* cell = _tableView.lt_take_cell(@"UITableViewCell");//通过类名取出cell
        cell.textLabel.text = ary[index.row];
        return cell;
    })
    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
