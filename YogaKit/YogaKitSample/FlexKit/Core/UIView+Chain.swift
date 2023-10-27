//
//  UIView+Chain.swift
//  FlexKit
//
//  Created by yun on 2023/8/19.
//

import Foundation
import UIKit

public protocol FlexViewChainProtocol{
    func backgroundColor(_ color:UIColor)->Self
    func cornerRadius(_ radius: CGFloat)->Self
    
}

public extension FlexViewChainProtocol where Self: UIView {
    @discardableResult
    func backgroundColor(_ color:UIColor) -> Self{
        self.backgroundColor = color
        return self
    }
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        return self
    }
}





