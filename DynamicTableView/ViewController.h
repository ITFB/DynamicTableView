//
//  ViewController.h
//  DynamicTableView
//
//  Created by Jevon on 14/11/26.
//  Copyright (c) 2014年 Jevon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *dynamicTableview;

-(CGFloat) getTheHeight:(NSInteger)row;
@end

