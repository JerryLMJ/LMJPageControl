//
//  LMJPageControl.h
//  PageControl
//
//  Version 1.0.0
//
//  Created by apple on 14-12-5.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMJPageControl : UIView

/**
 *  控件初始化，图片点形式
 *
 *  @param frame       控件的frame
 *  @param width       点的直径
 *  @param normalImg   正常点的image
 *  @param selectedImg 选中点的image
 *
 *  @return 控件实例
 */
-(id)initWithFrame:(CGRect)frame pointSize:(CGFloat)width normalImage:(UIImage *)normalImg selectedImage:(UIImage *)selectedImg;

/**
 *  控件初始化，纯色点形式
 *
 *  @param frame         控件的frame
 *  @param width         点的直径
 *  @param normalColor   正常点的image
 *  @param selectedColor 选中点的image
 *
 *  @return 控件实例
 */
-(id)initWithFrame:(CGRect)frame pointSize:(CGFloat)width normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;


/**
 *  设置PageControl的点数
 *
 *  @param pages 点数
 */
-(void)setNumberOfPages:(NSInteger)pages;

/**
 *  设置当前点
 *
 *  @param page 当前点 取值范围:0 ~ ...
 */
-(void)setCurrentPage:(NSInteger)page;

@end
