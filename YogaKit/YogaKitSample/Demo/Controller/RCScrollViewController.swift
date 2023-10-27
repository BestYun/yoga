//
//  RCScrollViewController.swift
//  FlexKit
//
//  Created by yun on 2023/7/31.
//

import UIKit

class RCScrollViewController: UIViewController {
    let scrollView = UIScrollView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIScrollView"
        
        
                
        view.flex.flexDirection(.column).addSubviews {
            FHScrollView {
                for i in 0...10 {

                    HStackView(justifyContent: .center,alignItems: .center){
                        UILabel().chain.text("\(i)").view
                    }
                    .height(100)
                    .width(100)
                    .margin(20)
                    .backgroundColor(.systemPink)
                    .cornerRadius(10)
                }
            }
            .flex
            .height(160)
            .marginTop(100)
            .view
            .backgroundColor(.orange)
            .configView { scrollview in
                scrollview.contentInsetAdjustmentBehavior = .never
                
            }

            FVScrollView {
                for i in 0...10 {

                    HStackView(justifyContent: .center,alignItems: .center){
                        UILabel().chain.text("\(i)").view
                    }
                    .height(100)
                    .width(100)
                    .margin(20)
                    .backgroundColor(.systemPink)
                    .cornerRadius(10)
                }
            }
            .flex
            .flex(1)
            .marginTop(10)
            .configView { scrollview in
                scrollview.contentInsetAdjustmentBehavior = .never
                scrollview.backgroundColor = .orange
            }

            
            UIButton().chain.backgroundColor(.blue).view.flex.height(60).view
        }
                
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
 
        view.yoga.applyLayout(preservingOrigin: true)
    }
    
    
}
