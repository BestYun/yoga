//
//  ViewController.swift
//  FlexKit
//
//  Created by yun on 2023/7/26.
//

import UIKit
import YogaKit



class MainViewController: UIViewController {
    
    let screenWidth:CGFloat = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return tableView
    }()
    
    let vcs = ["FlexViewController",
               "SecondViewController"
               ,"RCScrollViewController"
               ,"YogaKitNativeViewController"
               ,"RCFlexLayoutPreservingOriginViewController"
               ,"RCTableViewViewController"
               ,"RCTableViewViewController2"
    ]
    
    
    let titles = ["FlexViewController","SecondViewController","UIScrollview","Native flex","applyPreservingOrigin","UITableView Demo ","动态计算UItablView高度第二种方式"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FlexViewKit"
        view.flex
            .flexDirection(.column)
            .addSubviews {
                tableView.flex.flex(1).view
            }
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.flex.applyLayout()
    }
    
}


extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellID",for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        
        cell?.textLabel?.text = titles[indexPath.row ]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let str = vcs[indexPath.row]
        
        //1. 获取命名空间(CFBundleExecutable这个键对应的值就是项目名称,也就是命名空间)
        guard let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
            print("获取命名空间失败")
            return
        }
        //2. 将字符串转化为类
        let name = nameSpace + "." + str
        guard let cls = NSClassFromString(name) else {
            print("获取类失败")
            return
        }
        
        //3. 将anyClass转换为指定的类型
        guard let vcCls = cls as? UIViewController.Type else {
            print("转换类型失败")
            return
        }
        //4. 通过class创建对象
        let vc = vcCls.init()
        vc.title = titles[indexPath.row ]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

