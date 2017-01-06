//
//  XYPickView.h
//  XYPickView
//
//  Created by 肖扬 on 2016/12/29.
//  Copyright © 2016年 肖扬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectIndexBlock)(NSInteger index);

@interface XYPickView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSInteger index;
}
@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UIView *backView; // 透明背景
@property (nonatomic, copy) SelectIndexBlock selectIndex;

- (void)returnIndex:(SelectIndexBlock)block;


@end
