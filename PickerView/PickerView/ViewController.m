//
//  ViewController.m
//  PickerView
//
//  Created by 古田 貴久 on 2013/05/28.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showPicker:(id)sender {
    self.pickerViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"PickerViewController"];
    self.pickerViewController.delegate = self;
    
    //pickerViewをサブビューとして表示
    //アニメーション完了時のビューの位置を設定
    UIView *pickerView = self.pickerViewController.view;
    CGPoint middleCenter = pickerView.center;
    
    //アニメーション開始時のビューの位置を計算
    UIWindow *mainWindow = ((AppDelegate*)[UIApplication sharedApplication].delegate).window;
    CGSize offSize = [UIScreen mainScreen].bounds.size;
    CGPoint offScreenCenter = CGPointMake(offSize.width/2.0, offSize.height*1.5);
    pickerView.center = offScreenCenter;
    
    [mainWindow addSubview:pickerView];
    
    //アニメーションを使用して、ビューをアニメーション完了時の位置に表示されるようにする
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    pickerView.center = middleCenter;
    [UIView commitAnimations];
    

}
//デリゲートメソッド
//行選択で呼び出される

- (void)applySelectedString:(NSString *)str{
    self.label.text = str;
}

//clearボタンが押されたら呼び出される
-(void)closePickerView:(PickerViewController *)controller{
    //viewをアニメーションを使ってゆっくり非表示に
    UIView *pickView = controller.view;
    
    //animation完了時の位置を計算
    CGSize offSize = [UIScreen mainScreen].bounds.size;//ステータスバーを含む(bounds)画面サイズ取得
    CGPoint offScreenCenter = CGPointMake(offSize.width/2.0, offSize.height*1.5); //中心点を求める＝中心位置を設定
    
    [UIView beginAnimations:nil context:(void*)pickView];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    //アニメーション終了時に呼び出す処理
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    pickView.center = offScreenCenter;
    [UIView commitAnimations];
    
}

//単位のpickerviewを閉じるアニメーションが終了した時に呼び出されるメソッド
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber*)finished context:(void*)context{
    //pickerviewを削除
    UIView *pickerView = (__bridge UIView *)context;
    [pickerView removeFromSuperview];
}

@end
