//
//  FChainKit.swift
//  FlexKit
//
//  Created by yun on 2023/8/1.
//

import Foundation
import UIKit


@dynamicMemberLookup
public struct FChainWrapper<Subject> {
    public let subject: Subject

    public init(_ subject: Subject) {
        self.subject = subject
    }

    public subscript<Value>(
        dynamicMember keyPath: WritableKeyPath<Subject, Value>
    ) -> ((Value) -> FChainWrapper<Subject>) {
        var subject = self.subject
        return { value in
            subject[keyPath: keyPath] = value
            return  FChainWrapper(subject)
        }
    }
}

public protocol FChainWrapperCompatible {
    associatedtype ChainWrapperBase

    static var chain: FChainWrapper<ChainWrapperBase>.Type { get set }
    var chain: FChainWrapper<ChainWrapperBase> { get }
    
}

extension FChainWrapperCompatible {
    public static var chain: FChainWrapper<Self>.Type {
        return FChainWrapper<Self>.self
     }

    public var chain: FChainWrapper<Self> {
        return FChainWrapper(self)
    }
}




