//
//  LTTableView.m
//  LTTableViewDemo
//
//  Created by 李涛 on 16/6/8.
//  Copyright © 2016年 李涛. All rights reserved.
//

#import "LTTableView.h"
@interface LTTableView()<UITableViewDataSource,UITableViewDelegate>
/**
 *  区数
 */
@property(nonatomic,assign)NSInteger section;
/**
 *  设置每个区cell个数
 */
@property(nonatomic,strong)NSInteger (^rowInsection)(NSInteger);
/**
 *  设置每个cell
 */
@property(nonatomic,strong)UITableViewCell*(^cellAtIndex)(NSIndexPath*);

/**
 *  点击cell回调
 */
@property(nonatomic,strong)void(^selectRowAtIndex)(NSIndexPath*);

/**
 *  每个cell的高度
 */
@property(nonatomic,strong)CGFloat(^rowHeightIndex)(NSIndexPath*);

@end
@implementation LTTableView

-(void)awakeFromNib{
    self.delegate = self;
    self.dataSource = self;
}

/**
 *  注册cell  数组中是cell的class
 */
-(LTTableView* (^)(NSArray*))lt_registered_cell{
    return ^LTTableView*(NSArray* cells){
        for (Class class in cells) {
            [self registerClass:class forCellReuseIdentifier:NSStringFromClass(class)];
        }
        return self;
    };
}

/**
 *  通过类名str取出cell
 */
-(UITableViewCell* (^)(NSString*))lt_take_cell{
    return ^UITableViewCell*(NSString* cellStr){
        return [self dequeueReusableCellWithIdentifier:cellStr];
    };
}

/**
 *  设置分区数
 */
-(LTTableView* (^)(NSInteger))lt_section{
    return ^LTTableView*(NSInteger section){
        self.section = section;
        return self;
    };
}

/**
 *  设置每个区行数
 */
-(LTTableView*(^)(NSInteger (^)(NSInteger)))lt_row{
    return ^LTTableView*(NSInteger (^rowInsection)(NSInteger)){
        self.rowInsection = rowInsection;
        return self;
    };
}

/**
 *  设置每个cell
 */
-(LTTableView*(^)(UITableViewCell*(^)(NSIndexPath*)))lt_cell{
    return ^LTTableView*(UITableViewCell*(^cellAtIndex)(NSIndexPath*)){
        self.cellAtIndex = cellAtIndex;
        return self;
    };
}


/**
 *  点击cell回调
 */
-(LTTableView*(^)(void (^)(NSIndexPath*)))lt_selectRowIndex{
    return ^LTTableView*(void (^selectRowIndex)(NSIndexPath*)){
        self.selectRowAtIndex = selectRowIndex;
        return self;
    };
}

/**
 *  设置每个cell高度
 */
-(LTTableView*(^)(CGFloat (^)(NSIndexPath*)))lt_rowHeightIndex{
    return ^LTTableView*(CGFloat (^rowHeightIndex)(NSIndexPath*)){
        self.rowHeightIndex = rowHeightIndex;
        return self;
    };
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.section;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.rowInsection) {
        return self.rowInsection(section);
    }
    else{
        return 0;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellAtIndex) {
        return self.cellAtIndex(indexPath);
    }
    else{
        return 0;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectRowAtIndex) {
        self.selectRowAtIndex(indexPath);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.rowHeightIndex) {
        return self.rowHeightIndex(indexPath);
    }
    else{
        return 44.f;
    }
}
@end
