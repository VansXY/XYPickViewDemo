//
//  XYPickView.m
//  XYPickView
//
//  Created by 肖扬 on 2016/12/29.
//  Copyright © 2016年 肖扬. All rights reserved.
//

#import "XYPickView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kW [UIScreen mainScreen].bounds.size.width / 375

@implementation XYPickView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviewWithFrame:frame];
    }
    return self;
}

// 加载数组里面的数据
- (void)layoutSubviews
{
    [_pickView reloadAllComponents];
}

- (void)addSubviewWithFrame:(CGRect)frame
{
    UIView *superView;
    UIView *window = [[[UIApplication sharedApplication] delegate] window];
    superView = window;
    
    _backView = [[UIView alloc] initWithFrame:superView.bounds];
    _backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    [superView addSubview:_backView];
    
    
    _pickView = [[UIPickerView alloc] initWithFrame:frame];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _pickView.backgroundColor = [UIColor whiteColor];
    [_backView addSubview:_pickView];
    
    UIView *itemView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight - 230, kWidth, 30)];
    itemView.backgroundColor = [UIColor whiteColor];
    [_backView addSubview:itemView];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(kWidth - 60, 10, 60, 20);
    [button setTitle:@"确定" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(confirm) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [itemView addSubview:button];
    
    UIButton *cancel = [UIButton buttonWithType:(UIButtonTypeCustom)];
    cancel.frame = CGRectMake(0, 10, 60, 20);
    [cancel setTitle:@"取消" forState:(UIControlStateNormal)];
    [cancel addTarget:self action:@selector(cancelBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [cancel setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    [itemView addSubview:cancel];
    
    UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 230)];
    [_backView addSubview:tapView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPickView)];
    [tapView addGestureRecognizer:tap];
    
}

// 返回分区
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// 返回每个区的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _dataArray.count;
}

// 每项的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30;
}

// 每项的宽度
- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return kWidth;
}

// 每项的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = @"";
    str = [_dataArray objectAtIndex:row];
    return str;
}

// pickView 的点击方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    index = row;
}

// 更改每项的 title 大小
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    UILabel *myView = nil;
    if (component == 0) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(kWidth * 0.1, 0.0, kWidth * 0.8, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [_dataArray objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:14*kW];         //用label来设置字体大小
        myView.backgroundColor = [UIColor clearColor];
        
    }else {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(kWidth * 0.1, 0.0, kWidth * 0.8, 30)];
        myView.text = [_dataArray objectAtIndex:row];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.font = [UIFont systemFontOfSize:14*kW];
        myView.backgroundColor = [UIColor clearColor];
    }
    return myView;
    
}

// block回调
- (void)confirm
{
    self.selectIndex(index);
    [self dismissPickView];
}

- (void)cancelBtn
{
    [self dismissPickView];
}

- (void)dismissPickView
{
    [_backView removeFromSuperview];
    [_pickView removeFromSuperview];
}

- (void)returnIndex:(SelectIndexBlock)block {
    self.selectIndex = block;
}


@end
