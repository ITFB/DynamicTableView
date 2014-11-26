//
//  ContentCell.m
//  DynamicTableView
//
//  Created by Jevon on 14/11/26.
//  Copyright (c) 2014年 Jevon. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell
@synthesize bgImageView,headImageView,txtName,txtContent,imgPhoto;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"block_center_background.png"]];
        [bgImageView setFrame:CGRectMake(0, 0, 320, 220)];
        [self addSubview:bgImageView];
        
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(27, 6, 40, 40)];
        [self addSubview:headImageView];
        
        txtName = [[UILabel alloc] initWithFrame:CGRectMake(92, 6, 45, 19)];
        [txtName setBackgroundColor:[UIColor clearColor]];
        txtName.font = [UIFont systemFontOfSize:14];
        [self addSubview:txtName];
        
        txtContent = [[UILabel alloc]init];
        [txtContent setBackgroundColor:[UIColor clearColor]];
        [txtContent setFrame:CGRectMake(24, 51, 273, 220)];
        [txtContent setFont:[UIFont fontWithName:@"Arial" size:12]];
        [txtContent setLineBreakMode:UILineBreakModeTailTruncation];
        [self addSubview:txtContent];
        
        imgPhoto =  [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        //        [imgPhoto addTarget:self action:@selector(ImageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imgPhoto];
        
    }
    return self;
}

-(void) resizeTheHeight
{
    CGFloat contentWidth = 273;
    UIFont *font = [UIFont fontWithName:@"Arial" size:12];
    
    CGSize size = [txtContent.text sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 220) lineBreakMode:UILineBreakModeTailTruncation];
    
    [txtContent setFrame:CGRectMake(24, 51, 280, size.height+60)];
    
    [imgPhoto setFrame:CGRectMake(24, size.height+60+51, 273, 118)];
    [bgImageView setFrame:CGRectMake(0, 0, 320, size.height+260)];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
