//
//  FlexLayoutProtocol.swift
//  FlexKit
//
//  Created by yun on 2023/8/2.
//

import Foundation
import YogaKit

protocol FlexLayoutProtocol{
    //配置
    func isEnabled(_ isEnabled: Bool) -> Self
    func width(_ width: CGFloat)->Self
    func height(_ height: CGFloat) -> Self
    func direction(_ direction:YGDirection) ->Self
    func flexDirection(_ flexDirection:YGFlexDirection) ->Self
    ///主轴布局
    func justifyContent(_ justifyContent:YGJustify) ->Self
    ///次轴布局: 针对多行布局
    func alignContent(_ alignContent:YGAlign) ->Self
    ///次轴布局: 针对单行布局
    func alignItems(_ alignItems:YGAlign)->Self
    ///设置自身对齐方式
    func alignSelf(_ alignSelf:YGAlign) ->Self
    func padding(_ padding:CGFloat)->Self
    func margin(_ margin:CGFloat)->Self
    
    ///定位
    func position(_ position:YGPositionType)->Self
    
    func flexWrap(_ flexWrap:YGWrap)->Self
    func overflow(_ overflow:YGOverflow)->Self
    ///是否隐藏当前view
    func display(_ display:YGDisplay)->Self
    ///flex=1时 flexGrow = 1 (flexShrink = 1 flexBasis = 0,固定写法) 简写
    ///flex=2时 flexGrow = 2 flexShrink = 1 flexBasis = 0 简写
    func flex(_ flex:CGFloat)->Self
    func flexGrow(_ flexGrow:CGFloat)->Self
    func flexShrink(_ flexShrink:CGFloat)->Self
    func flexBasis(_ flexBasis:CGFloat)->Self
    
    //结合position
    func left(_ left:CGFloat)->Self
    func top(_ top:CGFloat)->Self
    func right(_ right:CGFloat)->Self
    func bottom(_ bottom:CGFloat)->Self
    ///对应left
    func start(_ start:CGFloat)->Self
    ///right
    func end(_ end:CGFloat)->Self
    
    
    func marginLeft(_ marginLeft:CGFloat)->Self
    func marginTop(_ marginTop:CGFloat)->Self
    func marginRight(_ marginRight:CGFloat)->Self
    func marginBottom(_ marginBottom:CGFloat)->Self
    ///对应marginLeft
    ///Controls the distance a child’s start edge is from the parent’s start edge. In left-to-right direction (LTR), it corresponds to the left() property and in RTL to right() property.
    //    控制子项的起始边与父级的起始边之间的距离。在从左到右的方向 （LTR） 中，它对应于属性left() ,在 RTL 中对应于 right() 属性。
    ///.direction(.LTR)-> marginStart = marginLeft
    func marginStart(_ marginStart:CGFloat)->Self
    ///对应marginRight
    func marginEnd(_ marginEnd:CGFloat)->Self
    func marginHorizontal(_ marginHorizontal:CGFloat)->Self
    func marginVertical(_ marginVertical:CGFloat)->Self
    ///padding
    func paddingLeft(_ paddingLeft:CGFloat)->Self
    func paddingTop(_ paddingTop:CGFloat)->Self
    func paddingRight(_ paddingRight:CGFloat)->Self
    func paddingBottom(_ paddingBottom:CGFloat)->Self
    func paddingStart(_ paddingStart:CGFloat)->Self
    func paddingEnd(_ paddingEnd:CGFloat)->Self
    func paddingHorizontal(_ paddingHorizontal:CGFloat)->Self
    func paddingVertical(_ paddingVertical:CGFloat)->Self
    
    ///border
    func borderLeftWidth(_ borderLeftWidth:CGFloat)->Self
    func borderTopWidth(_ borderTopWidth:CGFloat)->Self
    func borderRightWidth(_ borderRightWidth:CGFloat)->Self
    func borderBottomWidth(_ borderBottomWidth:CGFloat)->Self
    
    func borderStartWidth(_ borderStartWidth:CGFloat)->Self
    func borderEndWidth(_ borderEndWidth:CGFloat)->Self
    
    func borderWidth(_ borderWidth:CGFloat)->Self
    
    func minWidth(_ minWidth:CGFloat)->Self
    func minHeight(_ minHeight:CGFloat)->Self
    func maxWidth(_ maxWidth:CGFloat)->Self
    func maxHeight(_ maxHeight:CGFloat)->Self
    
    ///Yoga specific properties, not compatible with flexbox specification
    func aspectRatio(_ aspectRatio:CGFloat)->Self
    //属性
    var yoga:YGLayout { get }    
}


extension FlexLayoutProtocol{
    
    @discardableResult
    func alignItems(_ alignItems: YGAlign) -> Self {
        self.yoga.alignItems = alignItems
        return self
    }
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.yoga.isEnabled = isEnabled
        return self
    }
    @discardableResult
    func direction(_ direction: YGDirection) -> Self {
        self.yoga.direction = direction
        return self
    }
    @discardableResult
    func flexDirection(_ flexDirection: YGFlexDirection) -> Self {
        self.yoga.flexDirection = flexDirection
        return self
    }
    @discardableResult
    func justifyContent(_ justifyContent: YGJustify) -> Self {
        self.yoga.justifyContent = justifyContent
        return self
    }
    @discardableResult
    func alignContent(_ alignContent: YGAlign) -> Self {
        self.yoga.alignContent = alignContent
        return self
    }
    @discardableResult
    func alignSelf(_ alignSelf: YGAlign) -> Self {
        self.yoga.alignSelf = alignSelf
        return self
    }
    @discardableResult
    func padding(_ padding: CGFloat) -> Self {
        self.yoga.padding = YGValue(padding)
        return self
    }
    @discardableResult
    func margin(_ margin: CGFloat) -> Self {
        self.yoga.margin = YGValue(margin)
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        self.yoga.width = YGValue(width)
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> Self {
        self.yoga.height = YGValue(height)
        return self
    }
    
    
    @discardableResult func position(_ position: YGPositionType) -> Self {
        self.yoga.position = position
        return self
    }
    
    @discardableResult func flexWrap(_ flexWrap: YGWrap) -> Self {
        self.yoga.flexWrap = flexWrap
        return self
    }
    
    @discardableResult func overflow(_ overflow: YGOverflow) -> Self {
        self.yoga.overflow = overflow
        return self
    }
    
    @discardableResult func display(_ display: YGDisplay) -> Self {
        self.yoga.display = display
        return self
    }
    
    @discardableResult func flex(_ flex: CGFloat) -> Self {
        self.yoga.flex = flex
        return self
    }
    
    @discardableResult func flexGrow(_ flexGrow: CGFloat) -> Self {
        self.yoga.flexGrow = flexGrow
        return self
    }
    
    @discardableResult func flexShrink(_ flexShrink: CGFloat) -> Self {
        self.yoga.flexShrink = flexShrink
        return self
    }
    
    @discardableResult func flexBasis(_ flexBasis: CGFloat) -> Self {
        self.yoga.flexBasis = YGValue(flexBasis)
        return self
    }
    
    @discardableResult func left(_ left: CGFloat) -> Self {
        self.yoga.left = YGValue(left)
        return self
    }
    
    @discardableResult func top(_ top: CGFloat) -> Self {
        self.yoga.top = YGValue(top)
        return self
    }
    
    @discardableResult func right(_ right: CGFloat) -> Self {
        self.yoga.right = YGValue(right)
        return self
    }
    
    @discardableResult func bottom(_ bottom: CGFloat) -> Self {
        self.yoga.bottom = YGValue(bottom)
        return self
    }
    
    @discardableResult func start(_ start: CGFloat) -> Self {
        self.yoga.start = YGValue(start)
        return self
    }
    
    @discardableResult func end(_ end: CGFloat) -> Self {
        self.yoga.end = YGValue(end)
        return self
    }
    
    @discardableResult func marginLeft(_ marginLeft: CGFloat) -> Self {
        self.yoga.marginLeft = YGValue(marginLeft)
        return self
    }
    
    @discardableResult func marginTop(_ marginTop: CGFloat) -> Self {
        self.yoga.marginTop = YGValue(marginTop)
        return self
    }
    
    @discardableResult func marginRight(_ marginRight: CGFloat) -> Self {
        self.yoga.marginRight = YGValue(marginRight)
        return self
    }
    
    @discardableResult func marginBottom(_ marginBottom: CGFloat) -> Self {
        self.yoga.marginBottom = YGValue(marginBottom)
        return self
    }
    
    @discardableResult func marginStart(_ marginStart: CGFloat) -> Self {
        self.yoga.marginStart = YGValue(marginStart)
        return self
    }
    
    @discardableResult func marginEnd(_ marginEnd: CGFloat) -> Self {
        self.yoga.marginEnd = YGValue(marginEnd)
        return self
    }
    
    @discardableResult func marginHorizontal(_ marginHorizontal: CGFloat) -> Self {
        self.yoga.marginHorizontal = YGValue(marginHorizontal)
        return self
    }
    
    @discardableResult func marginVertical(_ marginVertical: CGFloat) -> Self {
        self.yoga.marginVertical = YGValue(marginVertical)
        return self
    }
    
    @discardableResult func paddingLeft(_ paddingLeft: CGFloat) -> Self {
        self.yoga.paddingLeft = YGValue(paddingLeft)
        return self
    }
    
    @discardableResult func paddingTop(_ paddingTop: CGFloat) -> Self {
        self.yoga.paddingTop = YGValue(paddingTop)
        return self
    }
    
    @discardableResult func paddingRight(_ paddingRight: CGFloat) -> Self {
        self.yoga.paddingRight = YGValue(paddingRight)
        return self
    }
    
    @discardableResult func paddingBottom(_ paddingBottom: CGFloat) -> Self {
        self.yoga.paddingBottom = YGValue(paddingBottom)
        return self
    }
    
    @discardableResult func paddingStart(_ paddingStart: CGFloat) -> Self {
        self.yoga.paddingStart = YGValue(paddingStart)
        return self
    }
    
    @discardableResult func paddingEnd(_ paddingEnd: CGFloat) -> Self {
        self.yoga.paddingEnd = YGValue(paddingEnd)
        return self
    }
    
    @discardableResult func paddingHorizontal(_ paddingHorizontal: CGFloat) -> Self {
        self.yoga.paddingHorizontal = YGValue(paddingHorizontal)
        return self
    }
    
    @discardableResult func paddingVertical(_ paddingVertical: CGFloat) -> Self {
        self.yoga.paddingVertical = YGValue(paddingVertical)
        return self
    }
    
    @discardableResult func borderLeftWidth(_ borderLeftWidth: CGFloat) -> Self {
        self.yoga.borderLeftWidth = borderLeftWidth
        return self
    }
    
    @discardableResult func borderTopWidth(_ borderTopWidth: CGFloat) -> Self {
        self.yoga.borderTopWidth = borderTopWidth
        return self
    }
    
    @discardableResult func borderRightWidth(_ borderRightWidth: CGFloat) -> Self {
        self.yoga.borderRightWidth = borderRightWidth
        return self
    }
    
    @discardableResult func borderBottomWidth(_ borderBottomWidth: CGFloat) -> Self {
        self.yoga.borderBottomWidth = borderBottomWidth
        return self
    }
    
    @discardableResult func borderStartWidth(_ borderStartWidth: CGFloat) -> Self {
        self.yoga.borderStartWidth = borderStartWidth
        return self
    }
    
    @discardableResult func borderEndWidth(_ borderEndWidth: CGFloat) -> Self {
        self.yoga.borderEndWidth = borderEndWidth
        return self
    }
    
    @discardableResult func borderWidth(_ borderWidth: CGFloat) -> Self {
        self.yoga.borderWidth = borderWidth
        return self
    }
    
    @discardableResult func minWidth(_ minWidth: CGFloat) -> Self {
        self.yoga.minWidth = YGValue(minWidth)
        return self
    }
    
    @discardableResult func minHeight(_ minHeight: CGFloat) -> Self {
        self.yoga.minHeight = YGValue(minHeight)
        return self
    }
    
    @discardableResult func maxWidth(_ maxWidth: CGFloat) -> Self {
        self.yoga.maxWidth = YGValue(maxWidth)
        return self
    }
    
    @discardableResult func maxHeight(_ maxHeight: CGFloat) -> Self {
        self.yoga.maxHeight = YGValue(maxHeight)
        return self
    }
    
    @discardableResult func aspectRatio(_ aspectRatio: CGFloat) -> Self {
        self.yoga.aspectRatio = aspectRatio
        return self
    }
}

extension FlexLayoutProtocol where Self: YGLayout{
    //属性
    var yoga:YGLayout {
        return self
    }
}

///实现协议
///YGLayout拥有链式功能
extension YGLayout:FlexLayoutProtocol {}


