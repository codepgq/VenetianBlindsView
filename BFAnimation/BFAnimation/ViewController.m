//
//  ViewController.m
//  BFAnimation
//
//  Created by 盘国权 on 2018/9/27.
//  Copyright © 2018年 pgq. All rights reserved.
//

#import "ViewController.h"
#import "VenetianBlindsView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet VenetianBlindsView *ventianBlidnsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    

}
- (IBAction)angleSliderValueChange:(UISlider *)sender {
    self.ventianBlidnsView.angle = sender.value;
}
- (IBAction)progressSliderValueChange:(UISlider *)sender {
    self.ventianBlidnsView.progress = sender.value;
}


@end
