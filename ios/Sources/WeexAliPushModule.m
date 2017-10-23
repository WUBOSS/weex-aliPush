//
//  WeexAliPushModule.m
//  WeexPluginTemp
//
//  Created by  on 17/3/14.
//  Copyright © 2017年 . All rights reserved.
//

#import "WeexAliPushModule.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
NSString * const AliPushNotificationReceive=@"AliPushNotificationReceive";
NSString * const AliPushMessageReceive=@"AliPushMessageReceive";
NSString * const AliPushNotificationClick=@"AliPushNotificationClick";
@implementation WeexAliPushModule

WX_PlUGIN_EXPORT_MODULE(weexAliPush, WeexAliPushModule)
WX_EXPORT_METHOD(@selector(receiveNotification:))
WX_EXPORT_METHOD(@selector(receiveAlimessage:))
WX_EXPORT_METHOD(@selector(notifacationClick:))
-(void)receiveNotification:(WXKeepAliveCallback)callBack
{
    self.notification = callBack;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aliPush:) name:AliPushNotificationReceive object:nil];
}
-(void)receiveAlimessage:(WXKeepAliveCallback)callBack
{
    self.message = callBack;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aliMessage:) name:AliPushMessageReceive object:nil];
    
}
-(void)notifacationClick:(WXKeepAliveCallback)callBack
{
    self.click = callBack;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageClick:) name:AliPushNotificationClick object:nil];
}
-(void)aliPush:(NSNotification *)push
{
    if(self.notification)
    {
        self.notification(push.userInfo, YES);
    }
}
-(void)aliMessage:(NSNotification*)message
{
    if(self.message)
    {
        self.message(message.userInfo, YES);
    }
}
-(void)messageClick:(NSNotification*)message
{
    if(self.click)
    {
        self.click(message.userInfo, YES);
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
@end
