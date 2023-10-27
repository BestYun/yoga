//
//  FlexViewController.swift
//  FlexKit
//
//  Created by yun on 2023/7/30.
//

import UIKit

class FlexViewController: UIViewController {
    
    let text = "this is text "
    
    lazy var hStack = HStackView{
        UIView().flex.width(100).height(100).chain.backgroundColor(.orange).view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FlexViewController"
        
        view.flex.flexDirection(.column)
        view.backgroundColor = .orange
        
        view.flex.addSubviews {
            
            HStackView {
                
                UIView().flex.width(100).height(20).chain.backgroundColor(.orange).view
                
                FText("您好")
                    .textColor(.white)
                    .backgroundColor(.systemPink)
                    .paddingLeft(20)
                    .paddingRight(10)
                    .textAlignment(.center)

                
            }
            .marginTop(100)
            .marginLeft(20)
            .marginRight(20)
            .backgroundColor(.blue)
            .padding(20)
            
            
            FText("您好")
                .margin(20)
                .textColor(.white)
                .backgroundColor(.systemPink)
                .paddingLeft(10)

            
            FlexRow {
                for _ in 0...10 {
                    UIView().flex
                        .width(30)
                        .height(30)
                        .margin(10)
                        .chain
                        .backgroundColor(.blue)
                        .view
                }
                
            }
            .marginHorizontal(20)
            .chain
            .backgroundColor(.yellow)
            .view
            
            FlexRowWrap{
                for _ in 0...10 {
                    UIView().chain.backgroundColor(.brown).view
                        .flex.width(30).height(30).margin(10).view
                }
            }
            .margin(20)
            .chain
            .backgroundColor(.darkGray)
            .view
            
            UILabel()
                .flex
                .marginTop(20)
                .marginHorizontal(20)
                .chain
                .text("hell FChainWrapper hell FChainWrapper hell FChainWrapper hell FChainWrapperhell FChainWrapperhell FChainWrapperhell FChainWrapperhell FChainWrapperhell FChainWrapper")
                .textColor(.white)
                .numberOfLines(0)
                .backgroundColor(.blue)
                .view
            
            
            UILabel { layout in
                layout.marginTop(20)
                    .marginHorizontal(20)
                
            } configView: { label in
                _ = label.chain
                    .text("hell FChainWrapper hell FChainWrapper hell FChainWrapper hell FChainWrapperhell FChainWrapperhell FChainWrapperhell FChainWrapperhell FChainWrapperhell FChainWrapper")
                    .textColor(.white)
                    .numberOfLines(0)
                    .backgroundColor(.blue)
            }
            
            UIStackView { layout in
                layout.marginTop(20)
                    .marginHorizontal(20)
                    .height(50)

            } configView: { stackView in
                stackView.backgroundColor = .blue
            }
        }
        
        view.yoga.applyLayout(preservingOrigin: true)
        
    }
    
    @objc func onClick(){
        print("---onClick")
    }
    
    deinit {
        print("deinit = \(self)")
    }
}

