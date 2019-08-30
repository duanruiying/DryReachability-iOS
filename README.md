# DryReachability-iOS
iOS: 网络状态监控
[依赖](https://github.com/ashleymills/Reachability.swift)

## Prerequisites
* iOS 10.0+
* Swift 5.0+

## Installation
* pod 'DryReachability-iOS'

## Features
```
/// 监控App蜂窝联网权限
DryReachability.applicationStateObserver({ (state) in
    print(state.rawValue)
})

/// 获取设备网络状态
print(DryReachability.deviceState())

/// 监控设备网络状态
DryReachability.deviceStateObserver { (state) in
    print(state.rawValue)
}
```

```
App处于后台时，需要申请后台时间，才能实时监控网络状态:
==================================Object C==================================
(1)在AppDelegate创建属性:
@interface AppDelegate ()
@property (assign) UIBackgroundTaskIdentifier bgTaskID;//后台任务时间申请
@end

(2)在applicationDidEnterBackground中申请:
- (void)applicationDidEnterBackground:(UIApplication *)application {

    /// 申请后台运行时间
    __weak typeof(self) weakSelf = self;
    self.bgTaskID = [application beginBackgroundTaskWithExpirationHandler:^{
        /// 后台运行时间超时回调(达到系统分配时间上限)
        [application endBackgroundTask:weakSelf.bgTaskID];
        weakSelf.bgTaskID = UIBackgroundTaskInvalid;
    }];

    /// 申请后台运行时间失败
    if (self.bgTaskID == UIBackgroundTaskInvalid) {
        return;
    }
}

==================================Swift===================================
(1)在AppDelegate创建属性
class AppDelegate: UIResponder {
    var bgTaskID: UIBackgroundTaskIdentifier?//后台任务时间申请
}

(2)在applicationDidEnterBackground中申请
func applicationDidEnterBackground(_ application: UIApplication) {

    /// 申请后台运行时间
    weak var weakSelf = self
    self.bgTaskID = application.beginBackgroundTask(expirationHandler: {
        /// 后台运行时间超时回调(达到系统分配时间上限)
        if weakSelf != nil && weakSelf!.bgTaskID != nil {
            application.endBackgroundTask(weakSelf!.bgTaskID!)
            weakSelf!.bgTaskID = UIBackgroundTaskIdentifier.invalid
        }
    })

    /// 申请后台运行时间失败
    if self.bgTaskID == UIBackgroundTaskIdentifier.invalid {
        return
    }
}
```
