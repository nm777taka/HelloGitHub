//
//  PickerViewController.m
//  PickerView
//
//  Created by 古田 貴久 on 2013/05/28.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.picker.delegate = self;
    self.picker.dataSource = self;
}

//要素が選択されたら呼ばれるメソッド
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.delegate applySelectedString:[NSString stringWithFormat:@"%d",row]];
    
}

//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 10;
}

//各行に表示する文字列
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%d",row];
}

-(IBAction)closePickerView:(id)sender{
    [self.delegate closePickerView:self];
}


@end
