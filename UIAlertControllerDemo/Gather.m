//
//  Gather.m
//  封装1
//
//  Created by mac_pro on 15/10/20.
//  Copyright © 2015年 camelot. All rights reserved.
//

#import "Gather.h"



@interface Gather ()
{
    
//    UIAlertAction * secureTextAlertAction;
    
  //  NSString * str;

}

@property(nonatomic,strong)UIViewController * alert;

@property(nonatomic,strong)UIAlertAction * secureTextAlertAction;

@property(nonatomic,strong)NSString * str;




@end


@implementation Gather



static Gather * _gather;


+(instancetype)sharegather{
    
    if (!_gather) {
        
        _gather = [[Gather alloc]init];
        
    }
    return _gather;
    
    
}


+(void)Title1:(NSString *)title1 Meassage:(NSString *)meassage Closebutton:(NSString *)closebutton Okbutton:(NSString *)okbutton style:(UIAlertControllerStyle)alertStyle Close:(closebuttoncallback)close Ok:(okbuttonacallback)ok{
    
    //设置弹出框
    UIAlertController * alertCtr = [UIAlertController alertControllerWithTitle:title1 message:meassage preferredStyle:alertStyle];
    
    [Gather sharegather].AlertCtr = alertCtr;
    

    
    //创建按钮
    //设置第一个点击按钮
    
    if (closebutton == nil) {
        
    }else{
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:closebutton style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            //点击“确定”后触发事件
            NSLog(@"点击了%@按钮",closebutton);
            
         close();
            
        }];
        
      
        
        [alertCtr addAction:firstAction];
    }
    //设置第二个点击按钮
    if (okbutton == nil) {
        
    }else{
        
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:okbutton style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            NSLog(@"点击了第二个按钮--%@ ",okbutton);
            ok();
        }];
        
        [alertCtr addAction:secondAction];
        
    }
   
    //没有点击按钮时1秒后自动消失
    if (okbutton ==nil && closebutton ==nil) {
        //弹出弹出框
        //设置计时器
       
        [Gather sharegather].alert = alertCtr;
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[Gather sharegather].alert animated:YES completion:^{
            
            NSLog(@"提示框弹出");
            
            
        }];
        //延迟消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
            [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:^{
                
                NSLog(@"提示框消失");
                
                
            }];

            
        });

        
    }else{
        //弹出弹出框
        
        [Gather sharegather].alert = alertCtr;
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[Gather sharegather].alert animated:YES completion:^{
            
            NSLog(@"提示框弹出");
            
            
        }];
    }
    

    
}



-(void)createAlertWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)alertStyle firstActionTitle:(NSString *)fActionTitle secondActionTitle:(NSString *)sActionTitle Close:(closebuttoncallback)close Ok:(passwordCllback)ok

{
    
    //设置弹出框
    UIAlertController * alertCtr = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    
       //创建按钮
    //设置第一个点击按钮
    
    if (fActionTitle == nil) {
        
    }else{
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:fActionTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            //点击“确定”后触发事件
            NSLog(@"点击了%@按钮",fActionTitle);
            
            ok(_str);
            
            //移除通知
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertCtr.textFields.firstObject];
            
        }];
        
        
        firstAction.enabled = NO;
       
        [Gather sharegather].secureTextAlertAction = firstAction;
        
        [alertCtr addAction:firstAction];
    }
    //设置第二个点击按钮
    if (sActionTitle == nil) {
        
    }else{
        
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:sActionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"点击了第二个按钮--%@ ",sActionTitle);
            close();
        }];
       
        [alertCtr addAction:secondAction];
        
    }
    
    [alertCtr addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        
        textField.backgroundColor = [UIColor orangeColor];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
        
        
        [Gather sharegather].str = textField.text;
        
        textField.secureTextEntry = YES;
        
        
        
    }];
    
    //没有点击按钮时1秒后自动消失
    if (fActionTitle ==nil && sActionTitle ==nil) {
        //弹出弹出框
        [Gather sharegather].alert = alertCtr;

        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[Gather sharegather].alert animated:YES completion:^{
           
            NSLog(@"提示框弹出");
            //延迟消失
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:^{
                    
                    NSLog(@"提示框消失");
                    
                }];
                
            });
            
        }];
        
        
    }else{
        //弹出弹出框
        
        [Gather sharegather].alert = alertCtr;

        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[Gather sharegather].alert animated:YES completion:^{
            
            NSLog(@"提示框弹出");
            
            
        }];
    }
    
}

- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    
      NSLog(@"_____%lu",textField.text.length);
    
    //限制密码输入位数5位
    if (textField.text.length >= 5) {
        
        _secureTextAlertAction.enabled = YES;
        
        
    }

    //把密码复值给_str
    _str = textField.text;
    
}



@end
