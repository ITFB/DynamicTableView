//
//  ContentCell.h
//  DynamicTableView
//
//  Created by Jevon on 14/11/26.
//  Copyright (c) 2014年 Jevon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UITableViewCell
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *txtName;
@property (nonatomic, strong) UILabel *txtContent;
@property (nonatomic, strong) UIButton *imgPhoto;

-(void) resizeTheHeight;
@end
