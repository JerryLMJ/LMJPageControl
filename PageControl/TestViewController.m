//
//  TestViewController.m
//  PageControl
//
//  Created by apple on 14-12-5.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
//

#import "TestViewController.h"

#import "LMJPageControl.h"

@interface TestViewController ()
{
    LMJPageControl * _control1;
    LMJPageControl * _control2;
}
@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 300)];
    [scrollView setContentSize:CGSizeMake(320*5, 300)];
    [scrollView setBackgroundColor:[UIColor lightGrayColor]];
    [scrollView setDelegate:self];
    [scrollView setPagingEnabled:YES];
    [self.view addSubview:scrollView];
    
    _control1 = [[LMJPageControl alloc] initWithFrame:CGRectMake(10, 400, 300, 20) pointSize:12 normalColor:[UIColor blackColor] selectedColor:[UIColor redColor]];
    [_control1 setNumberOfPages:5];
    [_control1 setCurrentPage:0];
    [self.view addSubview:_control1];
    
    _control2 = [[LMJPageControl alloc] initWithFrame:CGRectMake(100, 450, 120, 10) pointSize:8 normalImage:[UIImage imageNamed:@"point1"] selectedImage:[UIImage imageNamed:@"point2"]];
    [_control2 setNumberOfPages:5];
    [_control2 setCurrentPage:0];
    [self.view addSubview:_control2];
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [_control1 setCurrentPage:scrollView.contentOffset.x/320];
    [_control2 setCurrentPage:scrollView.contentOffset.x/320];
}



@end
