//
//  FlexView.swift
//  FlexKit
//
//  Created by yun on 2023/7/27.
//

import Foundation
import UIKit
import YogaKit

//Container
public class FlexView: UIView{
    
    init(flexDirection: YGFlexDirection = .column,justifyContent:YGJustify = .flexStart, alignItems:YGAlign = .stretch, @FlexViewBuilder subviews: () -> [UIView]){
        super.init(frame: .zero)
        self.yoga.isEnabled(true)
            .flexDirection(flexDirection)
            .justifyContent(justifyContent)
            .alignItems(alignItems)
             
        let subviews = subviews()
        subviews.forEach { subview in
            subview.yoga.isEnabled(true)
            addSubview(subview)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


public class FlexRow: FlexView {
    
    init(justifyContent:YGJustify = .flexStart, alignItems:YGAlign = .stretch, @FlexViewBuilder subviews: () -> [UIView] ){
        super.init(flexDirection: .row,justifyContent: justifyContent,alignItems: alignItems, subviews: subviews)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


public class FlexColumn: FlexView {
    
    init(justifyContent:YGJustify = .flexStart, alignItems:YGAlign = .stretch, @FlexViewBuilder subviews: () -> [UIView] ){
        super.init(flexDirection: .column,justifyContent: justifyContent,alignItems: alignItems, subviews: subviews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


public class FlexWrap: FlexView {

    init(wrap: YGWrap,flexDirection:YGFlexDirection,justifyContent:YGJustify = .flexStart, alignItems:YGAlign = .stretch, @FlexViewBuilder subviews: () -> [UIView] ){
        super.init(flexDirection: flexDirection,justifyContent: justifyContent,alignItems: alignItems, subviews: subviews)
        yoga.flexWrap(wrap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

public class FlexRowWrap: FlexWrap {
    init(justifyContent:YGJustify = .flexStart, alignItems:YGAlign = .stretch, @FlexViewBuilder subviews: () -> [UIView] ){
        super.init(wrap: .wrap, flexDirection: .row, justifyContent: justifyContent,alignItems: alignItems, subviews: subviews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

public class FlexColumnWrap: FlexWrap {
    init(justifyContent:YGJustify = .flexStart, alignItems:YGAlign = .stretch, @FlexViewBuilder subviews: () -> [UIView] ){
        super.init(wrap: .wrap, flexDirection: .column, justifyContent: justifyContent,alignItems: alignItems, subviews: subviews)
        yoga.flexWrap(.wrap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 类似SwiftUI
typealias HStackView = FlexRow
typealias VStackView = FlexColumn
typealias HStackWrapView = FlexRowWrap
typealias VStackWrapView = FlexColumnWrap

public class ZStackView: FlexView {
    
    override init(flexDirection: YGFlexDirection = .column,justifyContent:YGJustify = .flexStart, alignItems:YGAlign = .stretch, @FlexViewBuilder subviews: () -> [UIView] ){
        
        let subviews = subviews()
        subviews.forEach { itemView in
            itemView.yoga.position(.absolute)
        }
        
        let block = {
            return subviews
        }
        
        super.init(flexDirection: flexDirection,justifyContent: justifyContent,alignItems: alignItems, subviews: block)
        self.yoga.position(.relative)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



extension FlexView: FlexViewChainProtocol {}
extension FlexView: FlexLayoutProtocol {}
