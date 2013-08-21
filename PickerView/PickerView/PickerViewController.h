//
//  PickerViewController.h
//  PickerView
//
//  Created by 古田 貴久 on 2013/05/28.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PickerViewController;

@interface PickerViewController : UIViewController
    <UIPickerViewDelegate,UIPickerViewDataSource>

@property(weak,nonatomic)IBOutlet UIPickerView *picker;

@property(weak,nonatomic)IBOutlet UIButton *closeBtn;

//処理先のデリゲート
@property(weak,nonatomic) id<PickerViewController> delegate;

-(IBAction)closePickerView:(id)sender;


@end

//デリゲートプロトコル
//デリゲートメソッド２つを定義

@protocol PickerViewController <NSObject>

-(void)applySelectedString:(NSString *)str;

-(void)closePickerView:(PickerViewController *)controller;


@end