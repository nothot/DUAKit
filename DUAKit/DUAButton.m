//
//  DUAButton.m
//  DUAKit
//
//  Created by dream duan on 2018/7/21.
//  Copyright © 2018年 dream duan. All rights reserved.
//

#import "DUAButton.h"

@implementation DUAButton

//titleEdgeInsets是titleLabel相对于其上下左右的inset，跟tableView的contentInset是类似的；
//如果只有title，那titleLabel的 上下左右 都是 相对于Button 的；
//如果只有image，那imageView的 上下左右 都是 相对于Button 的；
//如果同时有image和label，那image的 上下左 是 相对于Button 的，右 是 相对于label 的；
//label的 上下右 是 相对于Button的， 左 是 相对于image 的。


- (void)setImagePosition:(DUAButtonImageType)type space:(CGFloat)space
{
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + space / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + space / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + space - tempHeight;
    
    switch (type) {
        case DUAButtonImageLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, space/2);
            break;
            
        case DUAButtonImageRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space/2, 0, -(labelWidth + space/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + space/2), 0, imageWidth + space/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, space/2);
            break;
            
        case DUAButtonImageTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case DUAButtonImageBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            self.imageEdgeInsets = UIEdgeInsetsZero;
            self.titleEdgeInsets = UIEdgeInsetsZero;
            self.contentEdgeInsets = UIEdgeInsetsZero;
            break;
    }
}

@end
