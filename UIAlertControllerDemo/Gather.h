//
//  Gather.h
//  封装1
//
//  Created by mac_pro on 15/10/20.
//  Copyright © 2015年 camelot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^closebuttoncallback) ();

typedef void(^okbuttonacallback) ();

typedef void(^passwordCllback)(NSString *pass);


@interface Gather : UIViewController


@property(nonatomic,retain)UIAlertController * AlertCtr;

+(instancetype)sharegather;



+(void)Title1:(NSString *)title1 Meassage:(NSString *)meassage Closebutton:(NSString *)closebutton Okbutton:(NSString *)okbutton style:(UIAlertControllerStyle)alertStyle Close:(closebuttoncallback)close Ok:(okbuttonacallback)ok;



-(void)createAlertWithTitle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)alertStyle firstActionTitle:(NSString *)fActionTitle secondActionTitle:(NSString *)sActionTitle Close:(closebuttoncallback)close Ok:(passwordCllback)ok;



@end
