//
//  YogaKitNativeViewController.swift
//  FlexKit
//
//  Created by yun on 2023/8/1.
//

import UIKit
import YogaKit

class YogaKitNativeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("---YogaKitNativeViewController---")
        view.flex.flexDirection(.column)
        
        view.backgroundColor = .orange
        let contentView = {
            let contentView = UIView()
            contentView.backgroundColor = .blue
            contentView.configureLayout{ (layout:YGLayout) in
                layout.flexWrap(.wrap)
                    .isEnabled(true).marginTop(100).marginRight(10).marginLeft(10)
                    .flexDirection(.row)
                    .flex(1)
            }
            return contentView
        }()
        view.addSubview(contentView)
        for i in 0...20{
            let item = UILabel()
            item.backgroundColor = .orange
            item.configureLayout{ (layout:YGLayout) in
                layout.isEnabled = true
                layout.width = 20
                layout.height = 20
                layout.margin = 5
            }
            _ = item.chain.text("\(i)")
            //            contentView.addSubview(item)
        }
        
//        contentView.addSubview(
//            ZStack {
//
//                UIView().flex.left(10).top(10).width(50).height(50).view.chain.backgroundColor(.orange).view
//                UIView().flex.right(10).top(10).width(50).height(50).view.chain.backgroundColor(.orange)
//                UIView().flex.left(10).bottom(10).width(50).height(50).view.chain.backgroundColor(.orange)
//                UIView().flex.right(10).bottom(10).width(50).height(50).view.chain.backgroundColor(.orange)
//
//            }
//                .flex(1)
//                .height(300)
//                .chain
//                .backgroundColor(.yellow)
//                .view
//        )
        
        
        
        
        
        view.yoga.applyLayout(preservingOrigin: true)
        print("---end-----")
        print(contentView.yoga.marginRight)
        print(contentView.yoga.marginLeft)
        print(contentView.yoga.marginTop)
        print(contentView.yoga.marginBottom)
        
        
        
    }
    
    
    
}
