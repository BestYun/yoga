//
//  FScrollview.swift
//  FlexKit
//
//  Created by yun on 2023/8/20.
//

import Foundation
import YogaKit

public class FScrollView: UIScrollView {
    
    private var contentView = UIView()
    
    init(flexDireiton: YGFlexDirection = .column, @FlexViewBuilder subviews: () -> [UIView] ){
        super.init(frame: .zero)
        
        //默认不显示滚动条
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        //这个需要配置
        self.flex.flexDirection(flexDireiton)
        
        contentView
            .flex
            .flexDirection(flexDireiton)
            .addSubviews(subviews: subviews)
        
        if flexDireiton == .row || flexDireiton == .rowReverse {
            self.alwaysBounceHorizontal = true

        }else{
            self.alwaysBounceVertical = true
        }
        
        self.addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if showsVerticalScrollIndicator == true || showsHorizontalScrollIndicator {
            self.subviews.forEach { item in
//                print("\(type(of: item))")
                let typeStr = "\(type(of: item))"
                if typeStr  == "_UIScrollViewScrollIndicator"{
                    item.yoga.isIncludedInLayout = false
                }
            }
        }        
        let size = contentView.frame.size
        self.contentSize = CGSize(width: size.width, height: size.height)
        print(size)
    }
    
    
    func addSubviews(@FlexViewBuilder subviews: ()->[UIView]) {
        
        let subviews = subviews()
        
        subviews.forEach { item in
            item.yoga.isEnabled(true)
            contentView.addSubview(item)
        }
        self.flex.applyLayout()

    }
    
}


public class FHScrollView: FScrollView{
    
    init(@FlexViewBuilder subviews: () -> [UIView]) {
        super.init(flexDireiton: .row, subviews: subviews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public class FVScrollView: FScrollView{
    
    init(@FlexViewBuilder subviews: () -> [UIView]) {
        super.init(flexDireiton: .column, subviews: subviews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FScrollView: FlexViewChainProtocol{}
