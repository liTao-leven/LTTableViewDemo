//
//  LTTableView.h
//  LTTableViewDemo
//
//  Created by 李涛 on 16/6/8.
//  Copyright © 2016年 李涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTTableView : UITableView

/**
 *  设置分区
 */
-(LTTableView* (^)(NSInteger))lt_section;

/**
 *  设置row
 */
-(LTTableView*(^)(NSInteger (^)(NSInteger)))lt_row;

/**
 *  设置cell
 */
-(LTTableView*(^)(UITableViewCell*(^)(NSIndexPath*)))lt_cell;



/**
 *  注册cell  数组中是cell的class
 */
-(LTTableView* (^)(NSArray*))lt_registered_cell;

/**
 *  通过类名str取出cell
 */
-(UITableViewCell* (^)(NSString*))lt_take_cell;
@end
