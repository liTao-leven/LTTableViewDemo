//
//  LTTableView.m
//  LTTableViewDemo
//
//  Created by 李涛 on 16/6/8.
//  Copyright © 2016年 李涛. All rights reserved.
//

#import "LTTableView.h"
@interface LTTableView()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)NSInteger section;

@property(nonatomic,strong)NSInteger (^rowInsection)(NSInteger);
@property(nonatomic,strong)UITableViewCell*(^cellAtIndex)(NSIndexPath*);

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


-(LTTableView* (^)(NSInteger))lt_section{
    return ^LTTableView*(NSInteger section){
        self.section = section;
        return self;
    };
}


-(LTTableView*(^)(NSInteger (^)(NSInteger)))lt_row{
    return ^LTTableView*(NSInteger (^rowInsection)(NSInteger)){
        self.rowInsection = rowInsection;
        return self;
    };
}


-(LTTableView*(^)(UITableViewCell*(^)(NSIndexPath*)))lt_cell{
    return ^LTTableView*(UITableViewCell*(^cellAtIndex)(NSIndexPath*)){
        self.cellAtIndex = cellAtIndex;
        return self;
    };
}


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
@end
