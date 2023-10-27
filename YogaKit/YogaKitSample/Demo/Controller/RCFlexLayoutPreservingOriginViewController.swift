//
//  RCFlexLayoutPreservingOriginViewController.swift
//  FlexKit
//
//  Created by yun on 2023/8/13.
//

import UIKit

class RCFlexLayoutPreservingOriginViewController: UIViewController {

    var button: UIButton?
    var label:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PreservingOrigin = true 和false区别"
        view.flex.flex(1).addSubviews {
            
            ZStackView {
                UILabel().flex.left(20).top(20).width(100).height(100).chain.backgroundColor(.brown).text("原位置").view
                
                UILabel().flex.left(20).top(20).width(100).height(100).chain.backgroundColor(.yellow).text("对比原位置").view.bindTo(&label)
            }
            .height(300)
            .marginLeft(20)
            .marginRight(20)
            .marginTop(100)
            .chain
            .backgroundColor(.orange)
            .view
            
            UIButton()
                .flex
                .marginLeft(20)
                .marginRight(20)
                .marginTop(20)
                .height(40)
                .chain
                .backgroundColor(.blue)
                .view
                .bindTo(&button)
            
            
        }
        view.flex.applyLayout()
        
        button?.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
    }
    
    
    @objc func onClick(){
        UIView.animate(withDuration: 1) {
            self.label?.flex.width(80).height(80)
            self.label?.flex.applyLayout()
        }
    }
    
    deinit{
        print("deinit = \(self)")
    }

    
}
