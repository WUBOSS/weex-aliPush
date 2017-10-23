//
//  WeexAliPushModule.h
//  WeexPluginTemp
//
//  Created by 齐山 on 17/3/14.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
UIKIT_EXTERN NSString * const AliPushNotificationReceive;
UIKIT_EXTERN NSString * const AliPushNotificationClick;
UIKIT_EXTERN NSString * const AliPushMessageReceive;
@interface WeexAliPushModule : NSObject<WXModuleProtocol>
@property(nonatomic,copy)WXKeepAliveCallback notification;
@property(nonatomic,copy)WXKeepAliveCallback click;
@property(nonatomic,copy)WXKeepAliveCallback message;
@end
