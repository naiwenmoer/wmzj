//
//  ViewController.m
//  兔子
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *rubArray1;
@property(nonatomic,strong)NSMutableArray *rubArray2;
@property (nonatomic,strong) UIImageView *rub;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    [self configUI];
}

-(void)loadData
{
    _rubArray1 = [NSMutableArray array];
    _rubArray2 = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"笨蛋兔%d",i]];
        UIImage *image2 = [UIImage imageWithCGImage:image1.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
        [_rubArray1 addObject:image1];
        [_rubArray2 addObject:image2];
    }
}

-(void)configUI
{
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setTitle:@"向左边跑" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(50, 500, 100, 50);
    btn1.tag = 1000;
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"向右边跑" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(225, 500, 100, 50);
    btn2.tag = 2000;
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *rub = [[UIImageView alloc] initWithFrame:CGRectMake(300, 300, 60, 60)];
    
        rub.animationImages = _rubArray1;
        rub.animationDuration = 0.5;
        [self.view addSubview:rub];
        _rub = rub;
   
}


-(void)btnClick:(UIButton *)sender
{
    if (sender.tag == 1000) {
       _rub.image = [UIImage imageNamed:@"笨蛋兔0"];
        [_rub startAnimating];
        [UIView animateWithDuration:2 animations:^{
        _rub.center = CGPointMake(50, 300);
        } completion:^(BOOL finished){
            [_rub stopAnimating];
            
            _rub.animationImages = _rubArray2;
        }];
    }
    
    if (sender.tag == 2000) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"笨蛋兔0"]];
        _rub.image = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
        [_rub startAnimating];
        [UIView animateWithDuration:2 animations:^{
            _rub.center = CGPointMake(325, 300);
        } completion:^(BOOL finished){
            [_rub stopAnimating];
            _rub.image = [UIImage imageWithCGImage:_rub.image.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
        }];
    }
}

-(void)animatFinish
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
