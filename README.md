# LTTableViewDemo
优雅的创建TableView,目前只完成了基本功能\<br> 
.lt_registered_cell(@[[UITableViewCell class]])//注册cell\<br> 
    .lt_section(3)//分区\<br>
    .lt_row(^NSInteger(NSInteger section){\<br>
        NSArray* ary = dataSource[section];\<br>
        return ary.count;//每个区多少row\<br>
    })
    .lt_cell(^UITableViewCell*(NSIndexPath* index){\<br>
        NSArray* ary = dataSource[index.section];\<br>
        UITableViewCell* cell = _tableView.lt_take_cell(@"UITableViewCell");//通过类名取出cell\<br>
        cell.textLabel.text = ary[index.row];\<br>
        return cell;\<br>
    })\<br>
    ;\<br>
    
链式语法完成TableView的创建\<br>
