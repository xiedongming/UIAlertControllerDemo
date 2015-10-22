//
//  ViewController.m
//  封装1
//
//  Created by mac_pro on 15/10/20.
//  Copyright © 2015年 camelot. All rights reserved.
//

#import "ViewController.h"
#import "Gather.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
   
   
    [super viewDidLoad];
    
  
}



- (IBAction)Clickpassword:(UIButton *)sender {
    
    
    [[Gather sharegather] createAlertWithTitle:@"提示" message:@"今天天气好冷啊，记得多穿衣服" style:UIAlertControllerStyleAlert firstActionTitle:@"ok" secondActionTitle:@"close" Close:^{
        
        NSLog(@"点击了---取消");
        
        
    } Ok:^(NSString *pass) {
        
        NSLog(@"密码是----%@",pass);
        
        
    }];
    
    
}



- (IBAction)OnlyOne:(UIButton *)sender {
    
    
    [Gather Title1:@"提示" Meassage:@"要变天了" Closebutton:nil Okbutton:@"ok" style:UIAlertControllerStyleAlert Close:^{
        
        NSLog(@"点击了close");
        
    } Ok:^{
        
        NSLog(@"点击了ok");
        
    }];
    
    
}

- (IBAction)OnlyPrompt:(UIButton *)sender {
    
    
    [Gather Title1:@"提示" Meassage:@"要变天了" Closebutton:nil Okbutton:nil style:UIAlertControllerStyleAlert Close:^{
        
        NSLog(@"点击了close");
        
    } Ok:^{
        
        NSLog(@"点击了ok");
        
    }];
    

    
}

- (IBAction)AlertCkick:(UIButton *)sender {
    
    
    [Gather Title1:@"提示" Meassage:@"要变天了" Closebutton:@"close" Okbutton:@"ok" style:UIAlertControllerStyleAlert Close:^{
        
        NSLog(@"点击了close");
        
    } Ok:^{
        
        NSLog(@"点击了ok");
        
    }];

    
}


/**
 *
 *
 *  UIAlertControllerStyleActionSheet
 */

- (IBAction)Clickbutton:(UIButton *)sender {
    
    [Gather Title1:@"提示" Meassage:@"要变天了" Closebutton:@"close" Okbutton:@"ok" style:UIAlertControllerStyleActionSheet Close:^{
      
        NSLog(@"点击了close");
        
    } Ok:^{
        
        NSLog(@"点击了ok");
   
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
