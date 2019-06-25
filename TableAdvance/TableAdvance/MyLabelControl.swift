//
//  MyLabelControl.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/17.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class MyLableControl:UIViewController
{
     override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50) )
        self.view.backgroundColor = UIColor.red
        labelView.text = "测试"
    }
}
