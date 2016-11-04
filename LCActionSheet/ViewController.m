//
//  ViewController.m
//  LCActionSheet
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 Lemon. All rights reserved.
//

#import "ViewController.h"
#import "LCActionSheet.h"

@interface ViewController ()<LCActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"LCActionSheet";
    
    UIButton *blockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    blockBtn.frame = CGRectMake(0, 0, 200, 50);
    blockBtn.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame) - 50);
    [blockBtn setTitle:@"show(BLOCK)" forState:UIControlStateNormal];
    [blockBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [blockBtn addTarget:self action:@selector(showBlock) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockBtn];
    
    UIButton *delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delegateBtn.frame = CGRectMake(0, 0, 200, 50);
    delegateBtn.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame) + 50);
    [delegateBtn setTitle:@"show(DELEGATE)" forState:UIControlStateNormal];
    [delegateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [delegateBtn addTarget:self action:@selector(showDelegate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delegateBtn];
}

- (void)showBlock {
    
    [LCActionSheet sr_showActionSheetViewWithTitle:@"This is show with BLOCK."
                                 cancelButtonTitle:@"Cancle"
                            destructiveButtonTitle:@"OK"
                                 otherButtonTitles:@[@"0", @"1", @"2"]
                                  selectSheetBlock:^(LCActionSheet *actionSheetView, NSInteger actionIndex) {
                                      NSLog(@"%zd", actionIndex);
                                  }];
}

- (void)showDelegate {
    
    [LCActionSheet sr_showActionSheetViewWithTitle:@"This is show with DELEGATE."
                                 cancelButtonTitle:@"Cancle"
                            destructiveButtonTitle:@"OK"
                                 otherButtonTitles:@[@"0", @"1", @"2"]
                                          delegate:self];
}

#pragma mark - LCActionSheetDelegate

- (void)actionSheet:(LCActionSheet *)actionSheet didSelectSheet:(NSInteger)index {
    
    NSLog(@"%zd", index);
}

@end
