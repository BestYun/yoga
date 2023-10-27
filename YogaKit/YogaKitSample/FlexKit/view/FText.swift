//
//  FText.swift
//  FlexKit
//
//  Created by yun on 2023/8/19.
//

import UIKit

class FText: UILabel {
    
    init(_ text:String?){
        super.init(frame: .zero)
        self.yoga.isEnabled(true)
        self.text = text
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension FText:FlexViewChainProtocol {}
extension FText: FlexLayoutProtocol {

    func numberOfLines(_ line: Int) -> Self{
        self.numberOfLines = line
        return self
    }
    
    func textColor(_ textColor: UIColor) -> Self{
        self.textColor = textColor
        return self
    }
    
    func font(_ font:UIFont) -> Self{
        self.font = font
        return self
    }
    
    func fontSize(_ fontSize:CGFloat) -> Self{
        self.font = .systemFont(ofSize: fontSize)
        self.font = .systemFont(ofSize: fontSize, weight: .black)
        return self
    }
    
//    func weight(_ weight: UIFont.Weight) -> Self{
//        var font = self.font
//
//        self.font = font
//        return self
//    }

    
    
    func textAlignment(_ textAlignment:NSTextAlignment) -> Self{
        self.textAlignment = textAlignment
        return self
    }
    
}

