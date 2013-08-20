//
//  mainViewController.h
//  Quta
//
//  Created by 古田 貴久 on 2013/08/19.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <time.h>
@interface mainViewController : UIViewController{
    
    UIImageView* _gunImageView;
    UIImageView* _IconImageView;
    CGRect IconRect;
}
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

@property (weak, nonatomic) IBOutlet UILabel *weekLabel;


@end
