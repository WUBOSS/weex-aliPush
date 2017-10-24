# weex-aliPush
weex-aliPush是一个weex ali推送插件，可以通过weexpack快速集成，可以丰富weex功能

支持的weexpack版本： >= 0.2.0
支持的WeexSDK版本： >= 0.10.0

# 功能

# 快速使用
- 通过weexpack初始化一个测试工程 weextest
   ```
   weexpack create weextest
   ```
- 添加ios平台
  ```
  weexpack platform add ios
  ```
- 添加android平台
  ```
  weexpack platform add android
  ```
- 添加插件
  ```
  weexpack plugin add weex-aliPush
  ```
# 项目地址
[github](please add you source code address)

# 已有工程集成
## iOS集成插件WeexAliPush
- 命令行集成
  ```
  weexpack plugin add weex-aliPush
  ```
- 手动集成
  在podfile 中添加
  ```
  pod 'WeexAliPush'
  ```

- api 
    - ios AppDelete加如下代码
 ```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [CloudPushSDK asyncInit:@"" appSecret:@"" callback:^(CloudPushCallbackResult *res) {
        if (res.success) {
            NSLog(@"Push SDK init success, deviceId: %@.", [CloudPushSDK getDeviceId]);
        } else {
            NSLog(@"Push SDK init failed, error: %@", res.error);
        }
    }];
    [CloudPushSDK sendNotificationAck:launchOptions];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onMessageReceived:)
                                                 name:@"CCPDidReceiveMessageNotification"
                                               object:nil];
    [self registerRemoteNotification];
    return YES;
}
- (void)onMessageReceived:(NSNotification *)notification {


    }
- (void)registerRemoteNotification {
    /*
     警告：Xcode8 需要手动开启"TARGETS -> Capabilities -> Push Notifications"
     */
    
    /*
     警告：该方法需要开发者自定义，以下代码根据 APP 支持的 iOS 系统不同，代码可以对应修改。
     以下为演示代码，注意根据实际需要修改，注意测试支持的 iOS 系统都能获取到 DeviceToken
     */
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0 // Xcode 8编译会调用
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionCarPlay) completionHandler:^(BOOL granted, NSError *_Nullable error) {
            if (!error) {
                NSLog(@"request authorization succeeded!");
            }
        }];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
#else // Xcode 7编译会调用
        UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
#endif
    } else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    } else {
        UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert |
                                                                       UIRemoteNotificationTypeSound |
                                                                       UIRemoteNotificationTypeBadge);
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
    }
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // 将收到的APNs信息传给个推统计
    
    [CloudPushSDK sendNotificationAck:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(nonnull void (^)(void))completionHandler {
    
    
    [CloudPushSDK sendNotificationAck:response.notification.request.content.userInfo];
    completionHandler();
}
```
```javascript

const plugin = weex.requireModule('weexAliPush');
// 收到通知
plugin.receiveNotification(function(ret){

});
// 收到消息
plugin.receiveAlimessage(function(ret){

});
// 通知点击
plugin.notifacationClick(function(ret){


});




```

  
