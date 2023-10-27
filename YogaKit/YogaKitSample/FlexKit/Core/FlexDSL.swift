//
//  FlexDSL.swift
//  FlexKit
//
//  Created by yun on 2023/7/30.
//

import Foundation
import UIKit
import YogaKit

public protocol FlexViewDSLProtocol{}

extension FlexViewDSLProtocol where Self:UIView {
    var flex: FlexViewDSL<Self>{
        return FlexViewDSL(view: self)
    }
}

extension UIView: FlexViewDSLProtocol{}

public struct FlexViewDSL<T:UIView>: FViewChainWrapperCompatible{
        
    let view: T
    init(view: T) {
        self.view = view
        view.yoga.isEnabled = true
    }
    
    public var chain: FViewChainWrapper<T> {
        return FViewChainWrapper(self.view)
    }
    
    
    @discardableResult
    func configView(_ self:(T)->Void)->T{
        self(view)
        return view
    }
    
    @discardableResult
    func bindTo(_ tempView:inout T?)-> T{
        tempView = view
        return view
    }

}


extension FlexViewDSL {
    func addSubviews(@FlexViewBuilder subviews: () -> [UIView]){
        subviews().forEach { item in
            item.yoga.isEnabled(true)
            self.view.addSubview(item)
        }
    }
    
   @discardableResult
   func layout(_ layout:(YGLayout)->Void)->T{
       layout(yoga)
       return view
   }
        
    var resolvedDirection: YGDirection {
        return yoga.resolvedDirection
    }
    func applyLayout(preservingOrigin:Bool = true){
        yoga.applyLayout(preservingOrigin: preservingOrigin)
    }
    func applyLayout(preservingOrigin: Bool, dimensionFlexibility: YGDimensionFlexibility) {
        yoga.applyLayout(preservingOrigin: preservingOrigin, dimensionFlexibility: dimensionFlexibility)
    }
    
    var intrinsicSize: CGSize {
        return yoga.intrinsicSize
    }
    
    func calculateLayout(with: CGSize) -> CGSize {
        return yoga.calculateLayout(with: with)
    }
    
    var numberOfChildren: UInt {
        return yoga.numberOfChildren
    }
    
    var isLeaf: Bool {
        return yoga.isLeaf
    }
    
    var isDirty: Bool {
        return yoga.isDirty
    }
    
    func markDirty() {
        yoga.markDirty()
    }
}

extension FlexViewDSL: FlexLayoutProtocol{
    var yoga: YGLayout{
        return view.yoga
    }
}

