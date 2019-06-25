//
//  BtnBackgroudViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/18.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class BtnBackgroudViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton.init(type: .custom) as UIButton
        btn.frame = CGRect(x: 10, y: 100, width: 300, height: 200)
        btn.backgroundColor = UIColor.lightGray
        btn.backgroundColor = UIColor(patternImage: UIImage(named: "IMG_2524.JPG")!)
        
        btn.setImage(UIImage(named: "IMG_2524.JPG"), for: .normal)
        btn.setTitle("swift按钮", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        self.view.addSubview(btn)
        // Do any additional setup after loading the view.
        
        let btn1 = UIButton.init(type: .custom) as UIButton
        btn1.frame = CGRect(x: 10, y: 360, width: 300, height: 200)
        btn1.backgroundColor = UIColor(patternImage: UIImage(named:"IMG_2524.JPG")!)
        
       btn1.setBackgroundImage(UIImage(named:"IMG_254.JPG"), for:.normal )
        
        btn1.setImage((UIImage(named: "IMG_2524.JPG")), for: .normal)
        
        self.view.addSubview(btn1)
    }
}
