//
//  ViewController.m
//  XYPickView
//
//  Created by 肖扬 on 2016/12/29.
//  Copyright © 2016年 肖扬. All rights reserved.
//

#import "ViewController.h"
#import "XYPickView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickMe:(id)sender {
    
    XYPickView *pickView   = [[XYPickView alloc] initWithFrame:CGRectMake(0, 467, 375, 200)];
    NSArray *array         = @[@"1", @"2", @"3", @"4", @"5", @"6"];
    pickView.dataArray     = array;
    
    [pickView returnIndex:^(NSInteger index) {
        _indexLabel.text   = [NSString stringWithFormat:@"你选择的是第%ld个", index + 1];
    }];
    [self.view addSubview:pickView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
