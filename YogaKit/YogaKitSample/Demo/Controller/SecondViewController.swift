//
//  ViewController.swift
//  FlexKit
//
//  Created by yun on 2023/7/26.
//

import UIKit
import YogaKit


class SecondViewController: UIViewController {
    
    let screenWidth:CGFloat = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var scrollView: FScrollView?
    var itemButton: UIButton?
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.flex.flexDirection(.column)
                        
        view.flex.addSubviews {
            FScrollView {
                FlexColumn {
                   flexView()
                   
                   //                stack()
                   //                userInfo()
                   //                test0()
                   //                test1()
                   //                test2()
               }

            }
            .flex
            .flex(1)
            .view
            .configView{ scroview in
                scroview.backgroundColor = .orange
            }
            .bindTo(&scrollView)
            
            UIButton().flex.height(60).configView { button in
                
                button.backgroundColor = .systemPink
                button.titleLabel?.textColor = .white
                button.setTitle("add Item", for: .normal)
                button.addTarget(self, action: #selector(onClick), for: .touchUpInside)

            }.bindTo(&itemButton)
            
        }
        

    }
    
    @objc func onClick(){
        print("-----")
        
        
        scrollView?.addSubviews {
            
            
            UIView().flex.width(100).height(100).margin(10).configView { view in
                view.backgroundColor = .brown
            }
            
        }
//        self.view.flex.applyLayout()
        
        
    }
    
    
    deinit{
        print("deinit = \(self)")
    }
    
    
    override func viewWillTransition(
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            //屏幕旋转
            // 1
            view.configureLayout{ (layout) in
                layout.width = YGValue(size.width)
                layout.height = YGValue(size.height)
            }
            // 2
            view.yoga.applyLayout(preservingOrigin: true)
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.flex.applyLayout()

        
    }
    
    func flexView()->UIView{
        
        return FlexColumn {
            
            UILabel().flex.layout{ layout in
                //正确显示
                layout.marginLeft(20)
                    .marginRight(20)
                    .marginTop(20)
                    .height(50)
            }.configView { label in
                
                _ = label.chain
                    .backgroundColor(.darkGray)
                    .text("layout.marginLeft(20).marginRight(20).marginTop(20).marginBottom(20).height(45)")
                    .font(UIFont.systemFont(ofSize: 13))
                
            }
            
            
            
            
            UILabel().flex.layout{ layout in
                //正确显示
                //设置结束边距。在 LTR 方向上，结束边距指定右边距。
                //在 RTL 方向上，结束边距指定左边距。
                
                layout.marginStart(20)
                    .marginEnd(50)
                    .marginTop(20)
                    .height(50)
                    .direction(.LTR)
                
            }.configView { label in
                
               _ = label.chain
                    .backgroundColor(.darkGray)
                    .text("direction = LTR marginStart = 由左边向右边 marginEnd = 由右向左")
                    .font(UIFont.systemFont(ofSize: 13))
                
            }
            
            
            UILabel().flex.layout{ layout in
                //正确显示
                //设置结束边距。在 LTR 方向上，结束边距指定右边距。
                //在 RTL 方向上，结束边距指定左边距。
                
                layout.marginStart(20)
                    .marginEnd(50)
                    .marginTop(20)
                    .height(50)
                    .direction(.RTL)
                
                
            }.configView { label in
                
               _ = label.chain
                    .backgroundColor(.darkGray)
                    .text("direction = RTL marginStart=marginRight 由右向左  marginEnd = margintLeft  由左边向右边")
                    .font(UIFont.systemFont(ofSize: 13))
            }
        }
    }
    //    func test0()->UIView{
    //        let userInfoView = UIView()
    //        userInfoView.backgroundColor = .brown
    //        userInfoView.configureLayout(block: { layout in
    //
    //            layout.width(self.screenWidth - 20*2)
    //                .height(80)
    //                .margin(20)
    //                .flexDirection(.row)
    //                .isEnabled(true)
    //                .justifyContent(.flexStart)
    //                .alignItems(.stretch)
    //
    //        })
    //
    //
    //        let imageView = UIView()
    //        imageView.backgroundColor = .orange
    //        imageView.configureLayout { layout in
    //            layout.width(80).isEnabled(true)
    //        }
    //        userInfoView.addSubview(imageView)
    //
    //
    //        return userInfoView
    //    }
    //
    //    func stack()->UIView{
    //        return UIView().flex.addSubviews {
    //
    //            UIView (flexDirection:.column,justifyContent: .center,alignItems: .center){
    //
    //
    //                UILabel { layout in
    //                    layout.width(50)
    //                        .height(50)
    //                        .left(10)
    //                        .top(10)
    //                        .position(.absolute)
    //                }
    //                .backgroundColor( .brown)
    //                .text("1")
    //
    //                UILabel{ layout in
    //                    layout.width(50)
    //                        .height(50)
    //                        .position(.absolute)
    //                        .right(10)
    //                        .top(10)
    //                }
    //                .backgroundColor( .brown)
    //                .text("2")
    //
    //                UILabel{ layout in
    //                    layout.width(50)
    //                        .height(50)
    //                        .position(.absolute)
    //                    //                        .alignSelf(.center)
    //
    //                }
    //                .backgroundColor( .brown)
    //                .text("3")
    //
    //
    //                UILabel{ layout in
    //                    layout.width(50)
    //                        .height(50)
    //                        .position(.absolute)
    //                        .right(10)
    //                        .bottom(10)
    //                }
    //                .backgroundColor( .brown)
    //                .text("4")
    //
    //
    //
    //                UILabel{ layout in
    //
    //                    layout.width(50)
    //                        .height(50)
    //                        .position(.absolute)
    //                        .left(10)
    //                        .bottom(10)
    //                }
    //                .backgroundColor( .brown)
    //                .text("5")
    //
    //
    //            }.flex.margin(20)
    //                .height(200)
    //                .view
    //                .backgroundColor( .blue)
    //        }.view
    //    }
    //
    //
    //    func test1()->UIView{
    //
    //        let blueView = {
    //
    //            let blueView = UIView()
    //            blueView.configureLayout { (layout: YGLayout) in
    //                layout.isEnabled = true
    //                layout.flexDirection = .row
    //                layout.width = 100
    //                layout.height = 100.0
    //
    //            }
    //            blueView.backgroundColor = .blue
    //            return blueView
    //        }()
    //
    //
    //        let redView = {
    //
    //            let redView = UIView()
    //            redView.configureLayout { (layout: YGLayout) in
    //                layout.isEnabled = true
    //                layout.margin = 20
    //                layout.width = 20
    //                layout.height = 20
    //            }
    //            redView.backgroundColor = .red
    //            return redView
    //        }()
    //        let redView2 = {
    //
    //            let redView = UIView()
    //            redView.configureLayout { (layout: YGLayout) in
    //                layout.isEnabled = true
    //                layout.margin = 20
    //                layout.width = 20
    //                layout.height = 20
    //            }
    //            redView.backgroundColor = .red
    //            return redView
    //        }()
    //        blueView.addSubview(redView)
    //        blueView.addSubview(redView2)
    //
    //        return blueView
    //
    //    }
    //
    //
    //    func test2()->UIView{
    //
    //        let blueView = UIView(flexDirection: .column, alignItems: .center) {
    //
    //            UIView { layout in
    //                layout.width(50).height(50)
    //            }.backgroundColor( .red)
    //
    //            UIView { layout in
    //                layout.width(50).height(50)
    //            }.backgroundColor( .orange)
    //
    //
    //            UIView { layout in
    //                layout.width(50).height(50).alignSelf(.flexStart)
    //            }.backgroundColor( .orange)
    //
    //
    //        }
    //            .flex.width(200)
    //            .height(200)
    //            .margin(20)
    //            .view
    //            .backgroundColor( .blue)
    //
    //        return blueView
    //
    //    }
    //
    //    func userInfo()->UIView{
    //
    //        let userInfoView = FlexRow {
    //            //头像
    //            UIView().flex.width(80).view.backgroundColor( .orange)
    //            FlexColumn(justifyContent: .spaceBetween){
    //
    //                FlexRow {
    //                    UILabel().text("用户昵称")
    //                    UILabel().text("7/27 10:31")
    //                }.backgroundColor( .yellow)
    //
    //                UILabel().text("消息内容")
    //            }
    //        }.backgroundColor( .brown)
    //            .width(screenWidth - 20*2)
    //            .height(80)
    //            .margin(20)
    //
    //
    //        let userInfoView2 = HStack {
    //            //头像
    //            UIView().flex.width(80).view.backgroundColor( .orange)
    //            VStack(justifyContent: .spaceBetween){
    //
    //                HStack {
    //                    UILabel().text("用户昵称")
    //                    UILabel().text("7/27 10:31")
    //                }.backgroundColor( .yellow)
    //
    //                UILabel().text("消息内容")
    //            }
    //        }.backgroundColor( .brown)
    //            .width(screenWidth - 20*2)
    //            .height(80)
    //            .margin(20)
    //
    //
    //        let userInfoView3 = UIView(flexDirection:.row) {
    //            //头像
    //            UIView().flex.width(80).height(80).view.backgroundColor( .orange)
    //            UIView(flexDirection: .column,justifyContent: .spaceBetween){
    //
    //                UIView(flexDirection:.row) {
    //                    UILabel().text("用户昵称222")
    //                    UILabel().text("7/27 10:31")
    //                }.backgroundColor( .yellow)
    //
    //                UILabel().text("消息内容22222")
    //            }.backgroundColor( .red)
    //        }
    //            .flex
    //            .width(screenWidth - 20*2)
    //            .height(80)
    //            .margin(20)
    //            .view
    //            .backgroundColor( .brown)
    //
    //
    //        return FlexColumn{
    //            userInfoView
    //            userInfoView2
    //            userInfoView3
    //        }
    //    }
    
}

