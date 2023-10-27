//
//  FlexViewProtocol.swift
//  FlexKit
//
//  Created by yun on 2023/8/3.
//

import Foundation
import UIKit
import YogaKit

///针对UIView 配置Flex

public protocol FlexLayoutViewProtocol{
    
}

extension FlexLayoutViewProtocol where Self: UIView{
    
    ///开启flex布局
    @inlinable
    init(flexLayout: @escaping YGLayoutConfigurationBlock, configView:((Self)->Void)?){
        self.init(frame: .zero)
        self.yoga.isEnabled = true
        self.configureLayout(block: flexLayout)
        if let configView = configView {
            configView(self)
        }
    }
    
    @discardableResult
    //返回view
    func configView(_ view:(Self)->Void)->Self{
        view(self)
        return self
    }
    
    @discardableResult
    func bindTo(_ view:inout Self?)-> Self{
        view = self
        return self
    }
    
}
///实现协议
extension UIView: FlexLayoutViewProtocol{}


