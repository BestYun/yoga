//
//  FViweChainKit.swift
//  FlexKit
//
//  Created by yun on 2023/8/1.
//

import Foundation
import UIKit


@dynamicMemberLookup
public class FViewChainWrapper<Subject> {
    public var view: Subject
    

    public init(_ view: Subject) {
        self.view = view
    }
    
    public subscript<Value>(
        dynamicMember keyPath: WritableKeyPath<Subject, Value>
    ) ->  (Value) -> FViewChainWrapper<Subject>{
        
        return { value in
            self.view[keyPath: keyPath] = value
            return  self
        }
    }
}

public protocol FViewChainWrapperCompatible {
    associatedtype T

    var chain: FViewChainWrapper<T> { get }

}

extension FViewChainWrapperCompatible where Self :UIView{
    public var chain: FViewChainWrapper<Self> {
        return FViewChainWrapper(self)
    }
}

extension UIView: FViewChainWrapperCompatible{}


