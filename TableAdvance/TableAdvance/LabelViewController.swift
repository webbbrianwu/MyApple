//
//  LabelViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/17.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let labelView = UILabel(frame: CGRect(x:30, y:100, width: 200, height: 50) )
        self.view.backgroundColor = UIColor.white
        labelView.text = "Hello,world!"
        self.view.addSubview(labelView)
    }
    

  

}
