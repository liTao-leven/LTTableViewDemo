# LTTableViewDemo
优雅的创建TableView<Br/>
目前只完成了基本功能
代码示例:
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
    
链式语法完成TableView的创建
