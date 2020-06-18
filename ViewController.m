//
//  ViewController.m
//  Timer
//
//  Created by chi on 2020/6/18.
//  Copyright © 2020 chi-ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.twoSecondToStop = 2;
    //timeLabel
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 200, 250, 120)];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    //self.timeLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.timeLabel];
    
    //button
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(90, 321, 250, 80)];
    [self.button setTitle:@"STOP" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor redColor];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(stopClockInTwoSeconds:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    //continueButton
    self.continueButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 400, 250, 80)];
    [self.continueButton setTitle:@"Continue" forState:UIControlStateNormal];
    self.continueButton.backgroundColor = [UIColor yellowColor];
    [self.continueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.continueButton addTarget:self action:@selector(continueClock:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.continueButton];
    //toast
    self.toast = [[UILabel alloc] initWithFrame:CGRectMake(90, 500, 250, 80)];
    self.toast.backgroundColor = [UIColor grayColor];
    self.toast.textAlignment = NSTextAlignmentCenter;
    self.toast.text = @"Clock will stop in 2 seconds!";
    //[self.view addSubview:self.toast]
    
    self.timeKeeper = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(keepOneSecond) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timeKeeper forMode:NSDefaultRunLoopMode];
    self.timeKeeperState = YES;
    
    self.timerForButton = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(toastTimer) userInfo:nil repeats:YES];
    
    
}

#pragma mark - 按钮方法
-(void)stopClockInTwoSeconds:(id)selector {
    

    [[NSRunLoop currentRunLoop] addTimer:self.timerForButton forMode:NSDefaultRunLoopMode];
    if(self.timeKeeperState) {
        [self.view addSubview:self.toast];
        self.timerForButton.fireDate = [NSDate distantPast];
    }
    
    //while(self.twoSecondToStop>0){}
    
    //[toast removeFromSuperview];
    //self.twoSecondToStop = 2;
    //self.timeKeeper.fireDate = [NSDate distantFuture];
}
-(void)continueClock:(id)selector {
    self.timeKeeper.fireDate = [NSDate distantPast];
    self.timeKeeperState = YES;
}

-(void)toastTimer {
    if(self.twoSecondToStop>0) {
        self.twoSecondToStop--;
    }
    else {
        [self.toast removeFromSuperview];
        self.twoSecondToStop = 2;
        self.timeKeeper.fireDate = [NSDate distantFuture];
        self.timerForButton.fireDate = [NSDate distantFuture];
        self.timeKeeperState = NO;
    }
}

-(void)keepOneSecond {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components;
    components= [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:date];
    self.timeLabel.text = [NSString stringWithFormat:@"%ld时%ld分%ld秒",components.hour,components.minute,components.second];
}



@end
