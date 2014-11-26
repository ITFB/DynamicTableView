//
//  ViewController.m
//  DynamicTableView
//
//  Created by Jevon on 14/11/26.
//  Copyright (c) 2014年 Jevon. All rights reserved.
//

#import "ViewController.h"
#import "ContentCell.h"
@interface ViewController ()
{
    NSArray *contentList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    contentList = @[@"亲加即时通讯云只是即时通讯的消息通道，甚至可以单纯的作为一个数据通道。本身不提供用户体系，既不保存任何APP业务数据，也不保存任何APP的用户信息。比如将亲加即时通讯云接入一个游戏APP，那么对于游戏内用户的资料，比如游戏用户的昵称，头像，电话，email，游戏等级等等信息，是保存在APP自己的业务服务器中的，这些信息不需要上传。 大多数应用都有自己的用户体系，亲加即时通讯云所做的是尽可能的方便用户使用已有的用户体系，而不是提供全新的用户体系为集成带来不必要的复杂性。亲加即时通讯云想做到最友好的接入",@"目前亲加支持自动注册、授权注册以及三方认证三种创建用户的方式。每个APP可以单独设置，也可以随时调整。无论选择何种注册方式，用户必须保证账号在appkey的范围内唯一。"];
    
    //设置背景颜色
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]]];
    self.dynamicTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dynamicTableview.backgroundColor = [UIColor clearColor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getTheHeight:indexPath.row];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellindentifier = @"ContentCell";
    ContentCell *cell = (ContentCell*)[tableView dequeueReusableCellWithIdentifier:cellindentifier];
    //    if (!cell) {
    //        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QHDynamicTableViewCell" owner:self options:nil];
    //        cell = [nib objectAtIndex:0];
    //    }
    
    if (cell == nil){
        //设置cell 样式
        cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellindentifier] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        [cell.txtContent setNumberOfLines:12];
    }
    
    cell.txtContent.text = [contentList objectAtIndex:indexPath.row];
    if ([indexPath row]==0) {
        cell.headImageView.image = [UIImage imageNamed:@"head1.jpg"];
        cell.txtName.text = @"薛仁贵";
        [cell.imgPhoto setBackgroundImage:[UIImage imageNamed:@"pic1.jpg"] forState:UIControlStateNormal];
    }else if ([indexPath row]==1){
        cell.headImageView.image = [UIImage imageNamed:@"head2.jpg"];
        cell.txtName.text = @"花仙子";
        [cell.imgPhoto setBackgroundImage:[UIImage imageNamed:@"pic2.jpg"] forState:UIControlStateNormal];

    }
    //自适应函数
    [cell resizeTheHeight];
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat) getTheHeight:(NSInteger)row
{
    CGFloat contentWidth = 280;
    // 设置字体
    UIFont *font = [UIFont fontWithName:@"Arial" size:12];
    
    // 显示的内容
    NSString *content = [contentList objectAtIndex:row];
    // 计算出长宽
    CGSize size = [content sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 220) lineBreakMode:UILineBreakModeTailTruncation];
    CGFloat height = size.height+280;
    // 返回需要的高度
    return height;
}
@end
