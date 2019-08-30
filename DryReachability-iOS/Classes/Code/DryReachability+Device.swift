//
//  DryReachability+Device.swift
//  DryReachability
//
//  Created by Ruiying Duan on 2019/7/27.
//

import UIKit
import Reachability

//MARK: - Device State
extension DryReachability {
    
    /// @说明 设备当前的网络状态
    /// @返回 DryReachabilityState
    public static func deviceState() -> DryReachabilityState {
        
        guard let connection = Reachability()?.connection else {
            return .none
        }
        
        switch connection {
        case .none: return .none
        case .wifi: return .wifi
        case .cellular: return .wwan
        }
    }
    
    /// @说明 设备网络状态观察
    /// @注释 调用deviceStateObserverStop停止观察
    /// @参数 stateHandler:   状态回调
    /// @返回 void
    public static func deviceStateObserver(_ stateHandler: @escaping (DryReachabilityState) -> Void) {
        
        DryReachability.shared().reach?.stopNotifier()
        try? DryReachability.shared().reach?.startNotifier()
        DryReachability.shared().reach?.whenReachable = { reach in
            switch reach.connection {
            case .none: stateHandler(.none)
            case .wifi: stateHandler(.wifi)
            case .cellular: stateHandler(.wwan)
            }
        }
        
        DryReachability.shared().reach?.whenUnreachable = { reach in
            switch reach.connection {
            case .none: stateHandler(.none)
            case .wifi: stateHandler(.wifi)
            case .cellular: stateHandler(.wwan)
            }
        }
    }
    
    /// @说明 停止设备网络状态观察
    /// @返回 void
    public static func deviceStateObserverStop() {
        DryReachability.shared().reach?.stopNotifier()
    }
}
