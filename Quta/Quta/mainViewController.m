//
//  mainViewController.m
//Users/furutatakahisa/Documents/Quta/Quta/mainViewController.m/  Quta
//
//  Created by 古田 貴久 on 2013/08/19.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()

@end

@implementation mainViewController

@synthesize DateLabel,weekLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //今日の日付と曜日を取得
    NSDate *today = [NSDate date];
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* components = [calender components:NSDayCalendarUnit|NSWeekdayCalendarUnit fromDate:today];
    NSInteger day = components.day;
    NSInteger weekday = components.weekday;
    DateLabel.text = [NSString stringWithFormat:@"%02d",day];
    
    switch (weekday) {
        case 1:
            weekLabel.text = @"SUN";
            break;
        case 2:
            weekLabel.text = @"MON";
            break;
            
        case 3:
            weekLabel.text = @"THU";
            break;
        case 4:
            weekLabel.text = @"WED";
            break;
        case 5:
            weekLabel.text = @"THU";
            break;
        case 6:
            weekLabel.text = @"FRI";
            break;
        case 7:
            weekLabel.text = @"SAT";
            break;
        default:
            break;
    }
    
    //UIImageViewを描画
    CGRect rect = CGRectMake(90, 80, 211, 87);
    _gunImageView = [[UIImageView alloc]initWithFrame:rect];
    
    //画像の読み込み
    _gunImageView.image = [UIImage imageNamed:@"gun.png"];
    
    [self.view addSubview:_gunImageView];
    _gunImageView.userInteractionEnabled = YES;
    
    //ICONを描画
    IconRect =  CGRectMake(5, 70, 76, 76);
    _IconImageView = [[UIImageView alloc]initWithFrame:IconRect];
    _IconImageView.image = [UIImage imageNamed:@"icon.png"];
    [self.view addSubview:_IconImageView];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//タッチ開始時に呼び出される
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //タッチされたUIImageViewの判定
    if([event touchesForView:_gunImageView]!=NULL){
        //銃を撃った時のアクション
        CGFloat angle = 20.0 * M_PI / 180.0;
        _gunImageView.transform = CGAffineTransformMakeRotation(angle);
        
        //弾痕を描画
        int gunshot_x = [self getRandomInt:IconRect.origin.x max:IconRect.size.width];
        int gunshot_y = [self getRandomInt:IconRect.origin.y max:IconRect.size.height];
        
//        NSLog(@"%02d,%02d",gunshot_x,gunshot_y);
        UIImageView* gunshotImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 68)];
        gunshotImage.center = CGPointMake(gunshot_x, gunshot_y);
        gunshotImage.image = [UIImage imageNamed:@"gunshot2.png"];
        [self.view addSubview:gunshotImage];
        
        
    }
}

//指が離れた瞬間に呼ばれる
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CGFloat angle = 0;
    _gunImageView.transform = CGAffineTransformMakeRotation(angle);
}

//乱数発生メソッド
- (int) getRandomInt:(int)min max:(int)max{
    
    return min+arc4random()%max;
}



@end
