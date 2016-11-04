//
//  LCActionSheet.h
//  LCActionSheet
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LCActionSheet;

@protocol LCActionSheetDelegate <NSObject>

@required
/**
 *  delegate's method
 *
 *  @param index top is 0 and 0++ to down but cancelBtn's index is -1
 */
- (void)actionSheet:(LCActionSheet *)actionSheet didSelectSheet:(NSInteger)index;

@end

/**
 *  block's call
 *
 *  @param index           the same to the delegate
 */
typedef void (^ActionSheetDidSelectSheetBlock)(LCActionSheet *actionSheetView, NSInteger index);


@interface LCActionSheet : UIView

@property (nonatomic, weak) id<LCActionSheetDelegate> delegate;

@property (nonatomic, copy) ActionSheetDidSelectSheetBlock selectSheetBlock;

#pragma mark - Block's way

+ (void)sr_showActionSheetViewWithTitle:(NSString *)title
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 destructiveButtonTitle:(NSString *)destructiveButtonTitle
                      otherButtonTitles:(NSArray  *)otherButtonTitles
                       selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock;

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray  *)otherButtonTitles
             selectSheetBlock:(ActionSheetDidSelectSheetBlock)selectSheetBlock;

#pragma mark - Delegate's way

+ (void)sr_showActionSheetViewWithTitle:(NSString *)title
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                 destructiveButtonTitle:(NSString *)destructiveButtonTitle
                      otherButtonTitles:(NSArray  *)otherButtonTitles
                               delegate:(id<LCActionSheetDelegate>)delegate;

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray  *)otherButtonTitles
                     delegate:(id<LCActionSheetDelegate>)delegate;

@end
