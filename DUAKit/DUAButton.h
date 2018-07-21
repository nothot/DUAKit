//
//  DUAButton.h
//  DUAKit
//
//  Created by dream duan on 2018/7/21.
//  Copyright © 2018年 dream duan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DUAButtonImageType) {
    DUAButtonImageTop,
    DUAButtonImageLeft,
    DUAButtonImageBottom,
    DUAButtonImageRight,
    DUAButtonImageNone
};

@interface DUAButton : UIButton

- (void)setImagePosition:(DUAButtonImageType)type space:(CGFloat)space;
@end
