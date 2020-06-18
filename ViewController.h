//
//  ViewController.h
//  Timer
//
//  Created by chi on 2020/6/18.
//  Copyright © 2020 chi-ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property UILabel *timeLabel;
@property UILabel *toast;

@property UIButton *button;
@property UIButton *continueButton;


@property NSTimer *timeKeeper;
@property BOOL timeKeeperState;

@property NSTimer *timerForButton;

@property NSInteger twoSecondToStop;

@end

