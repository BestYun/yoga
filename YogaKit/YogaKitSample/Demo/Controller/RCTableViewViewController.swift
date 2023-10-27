//
//  RCTableViewViewController.swift
//  FlexKit
//
//  Created by yun on 2023/8/20.
//

import UIKit


class RCTableViewViewController: UIViewController {
    
    
    private var data: [InfoData] = []
    
    let cellID = "cellID"
    
    var heightCache = [IndexPath:CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        for index in 0...100 {
            
            var item = InfoData()
            item.username = "yun\(index)"
            let randomString = NSUUID().uuidString
            
            let max = Int.random(in: 10...200)
            var content = "start \(index) \(randomString) === "
            var temp:[String] = []
            for _ in 0...max {
//                                let index = Int.random(in: 0..<base.count)
                
                temp.append("内容")
            }
            content = content + "\(temp.joined()) end==="
            item.content = content
            item.time = Date().description
            item.imgCount = Int.random(in: 0...9)
            data.append(item)
        }
        
        
        view.flex.addSubviews {
            RCFPSLabel(frame: .zero).flex.marginLeft(20).marginTop(80).height(30).width(100).view

            UITableView().flex.flex(1).configView { tableView in
                tableView.delegate = self
                tableView.dataSource = self

                tableView.register(RCCell.self, forCellReuseIdentifier: cellID)
                tableView.estimatedRowHeight = 60
                
            }

        }
        view.flex.applyLayout()
        
        
        
        
    }
    
    deinit{
        print("deinit =\(self)")
    }
}

extension RCTableViewViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
}

extension RCTableViewViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RCCell
        cell.infoData = data[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



private class RCCell: UITableViewCell {
    
    private var usernameLabel: UILabel?
    private var timeLabel: UILabel?
    private var contentLabel: UILabel?
    
    var infoData:InfoData? {
        didSet{
            usernameLabel?.text = infoData?.username
            contentLabel?.text = infoData?.content
            timeLabel?.text = infoData?.time

            //如果要修改内容,则需要将view标记markDirty,父视图调用了markDirty(),并不能将它所有的子视图都标记markDirty
            timeLabel?.flex.markDirty()
            usernameLabel?.flex.markDirty()
            contentLabel?.flex.markDirty()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.contentView.flex.flexDirection(.column).addSubviews {
            
            VStackView {
                
                HStackView(justifyContent: .center) {
                    
                    UIImageView()
                        .flex
                        .width(36)
                        .height(36)
                        .configView { imageView in
                            imageView.backgroundColor = .systemPink
                        }
                    
                    UILabel()
                        .flex
                        .flex(1)
                        .marginHorizontal(12)
                        .bindTo(&usernameLabel)
                    
                    UILabel()
                        .flex
                        .bindTo(&timeLabel)
                    
                }
                
                UILabel()
                    .flex
                    .marginTop(12)
                    .marginHorizontal(0)
                    .chain
                    .numberOfLines(0)
                    .view
                    .bindTo(&contentLabel)
                    
                FText("工具条").marginTop(10).marginHorizontal(12).height(30).backgroundColor(.cyan)
                
            }
            .margin(12)
            .padding(12)
            .backgroundColor(.orange)
            .cornerRadius(12)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.flex.applyLayout(preservingOrigin: false,dimensionFlexibility: .flexibleHeight)
    }
    

    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        //重新这个方法UITableViewCell->sizeThatFits,然后再调用applyLayout(preservingOrigin:dimensionFlexibility)方法计算高度
        //tableView.estimatedRowHeight = 60 需要预估计高度
        //同时配置tableView.rowHeight = UITableView.automaticDimension或者代理重新
        self.contentView.flex.applyLayout(preservingOrigin: false,dimensionFlexibility: .flexibleHeight)
        return self.contentView.frame.size
    }

}


private class InfoData{
    
    var username: String?
    var userIcon: String?
    var time: String?
    var content: String?
    
    //    var imgs: [String?]?
    var imgCount: Int?
    
    var cacheHeight: CGFloat?
    
    func updateCacheHeight(_ cacheHeight: CGFloat){
        self.cacheHeight = cacheHeight
    }
    
    
}
