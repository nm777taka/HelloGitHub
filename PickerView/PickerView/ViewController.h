//
//  ViewController.h
//  PickerView
//
//  Created by 古田 貴久 on 2013/05/28.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"
@interface ViewController : UIViewController <PickerViewController>
 
@property (weak, nonatomic) IBOutlet UIButton *pickbtn;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong,nonatomic)PickerViewController *pickerViewController;

- (IBAction)showPicker:(id)sender;

@end
