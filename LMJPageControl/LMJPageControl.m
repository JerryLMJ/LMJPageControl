//
//  LMJPageControl.m
//  PageControl
//
//  Version 1.0.0
//
//  Created by MajorLi on 14-12-5.
//  Copyright (c) 2014年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "LMJPageControl.h"

@implementation LMJPageControl
{
    CGFloat _pointWidth;
    
    UIColor * _normalColor;
    UIColor * _selectedColor;
    
    UIImage * _normalImg;
    UIImage * _selectedImg;
    
    BOOL _isImagePoint;
    
    BOOL _isSetPagesNumber;
}

- (id)init{
    NSAssert(NO, @"禁止使用init函数进行控件初始化，请使用initWithFrame:pointSize:normalImage:selectedImage:或initWithFrame:pointSize:normalColor:selectedColor:函数进行控件初始化!");
    return nil;
}
- (id)initWithFrame:(CGRect)frame{
    NSAssert(NO, @"禁止使用initWithFrame:函数进行控件初始化，请使用initWithFrame:pointSize:normalImage:selectedImage:或initWithFrame:pointSize:normalColor:selectedColor:函数进行控件初始化!");
    return nil;
}
-(id)initWithFrame:(CGRect)frame pointSize:(CGFloat)width normalImage:(UIImage *)normalImg selectedImage:(UIImage *)selectedImg{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _isSetPagesNumber = NO;
        
        _pointWidth = width;
        _normalImg = normalImg;
        _selectedImg = selectedImg;
        _isImagePoint = YES;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame pointSize:(CGFloat)width normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _isSetPagesNumber = NO;
        
        _pointWidth = width;
        _normalColor = normalColor;
        _selectedColor = selectedColor;
        _isImagePoint = NO;
    }
    return self;
}

-(void)setNumberOfPages:(NSInteger)pages{
    _isSetPagesNumber = YES;
    
    for (int i = 0; i <self.subviews.count; i++) {
        [[self.subviews objectAtIndex:i] removeFromSuperview];
    }
    
    CGFloat distanceBetweenPoints = (self.frame.size.width -_pointWidth*pages)/(pages-1);
    
    if (_isImagePoint) {
        
        for (int i = 0; i< pages; i++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((_pointWidth+distanceBetweenPoints)*i, (self.frame.size.height-_pointWidth)/2, _pointWidth, _pointWidth)];
            [imageView setImage:_normalImg];
            imageView.tag = 1000 + i;
            [self addSubview:imageView];
        }
    }else{
        for (int i = 0; i< pages; i++) {
            UIView * pointView = [[UIView alloc] initWithFrame:CGRectMake((_pointWidth+distanceBetweenPoints)*i, (self.frame.size.height-_pointWidth)/2, _pointWidth, _pointWidth)];
            [pointView setBackgroundColor:_normalColor];
            pointView.layer.cornerRadius = _pointWidth/2;
            pointView.tag = 2000 + i;
            [self addSubview:pointView];
        }
    }
}


-(void)setCurrentPage:(NSInteger)page{
    if (self.subviews.count == 0) {
        return;
    }
    
    if (_isImagePoint) {
        for (UIView * view in self.subviews) {
            
            UIImageView * imageView = (UIImageView *)view;
            
            if (imageView.tag - 1000 == page) {
                [imageView setImage:_selectedImg];
            }else{
                [imageView setImage:_normalImg];
            }
        }
    }else{
        for (UIView * view in self.subviews) {
            if (view.tag - 2000 == page) {
                [view setBackgroundColor:_selectedColor];
            }else{
                [view setBackgroundColor:_normalColor];
            }
        }
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
