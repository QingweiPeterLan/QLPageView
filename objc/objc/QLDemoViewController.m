//
//  QLDemoViewController.m
//  objc
//
//  Created by Qingwei Lan on 4/6/16.
//  Copyright © 2016 Qingwei Lan. All rights reserved.
//

#import "QLDemoViewController.h"
#import "QLPageView.h"

@interface QLDemoViewController () <QLPageViewDataSource, QLPageViewDelegate>

@property (nonatomic, strong) QLPageView *pageView;

@end

@implementation QLDemoViewController

#pragma mark - View Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _pageView = [[QLPageView alloc] initWithFrame:self.view.bounds];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.pageView.frame = self.view.bounds;
    self.pageView.pageViewStyle = QLPageViewButtonBarStyleWithLabel;
    self.pageView.dataSource = self;
    self.pageView.delegate = self;
    [self.view addSubview:self.pageView];
}

#pragma mark - QLPageViewDataSource

- (NSInteger)initialIndexForPageInPageView:(QLPageView *)pageView
{
    return 1;
}

- (NSInteger)numberOfPagesInPageView:(QLPageView *)pageView
{
    return 6;
}

- (NSString *)pageView:(QLPageView *)pageView titleForLabelForPageAtIndex:(NSInteger)index
{
    switch (index) {
        case 0: return @"Mon"; break;
        case 1: return @"Tue"; break;
        case 2: return @"Wed"; break;
        case 3: return @"Thu"; break;
        case 4: return @"Fri"; break;
        case 5: return @"Sat"; break;
        default: break;
    }
    return @"";
}

- (NSString *)pageView:(QLPageView *)pageView titleForButtonForPageAtIndex:(NSInteger)index
{
    return [NSString stringWithFormat:@"%ld", (long)(index+1)];
}

- (UIView *)pageView:(QLPageView *)pageView viewForPageAtIndex:(NSInteger)index
{
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    if ((index % 2) == 0)
        view.backgroundColor = [UIColor blackColor];
    else
        view.backgroundColor = [UIColor cyanColor];
    return view;
}

@end