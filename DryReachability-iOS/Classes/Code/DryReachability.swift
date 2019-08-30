//
//  DryReachability.swift
//  DryReachability
//
//  Created by Ruiying Duan on 2019/5/4.
//

import UIKit
import Reachability

//MARK: - 网络状态
public enum DryReachabilityState {
    /// None
    case none
    /// WiFi
    case wifi
    /// Wwan
    case wwan
}

//MARK: - DryReachability
public class DryReachability: NSObject {
    
    /// Reachability
    lazy var reach = {
        return Reachability.init(hostname: "apple.com")
    }()
    
    /// 单例
    private static let instance = DryReachability()
    @discardableResult
    static func shared() -> DryReachability {
        return instance
    }
    
    /// 构造
    private override init() {}
    
    /// 析构
    deinit {}
}
