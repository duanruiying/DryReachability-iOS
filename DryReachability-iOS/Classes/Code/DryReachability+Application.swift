//
//  DryReachability+Application.swift
//  DryReachability
//
//  Created by Ruiying Duan on 2019/7/27.
//

import UIKit
import CoreTelephony

//MARK: - Application
extension DryReachability {
    
    /// @说明 应用程序蜂窝联网权限观察
    /// @参数 stateHandler:   状态回调
    /// @返回 void
    public static func applicationStateObserver(_ stateHandler: @escaping (CTCellularDataRestrictedState) -> Void) {
        
        let data = CTCellularData()
        data.cellularDataRestrictionDidUpdateNotifier = { state in
            stateHandler(state)
        }
    }
}
