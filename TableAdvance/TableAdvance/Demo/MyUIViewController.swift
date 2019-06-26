//
//  MyUIViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/17.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//  测试提交

import UIKit

class MyUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let redView = UIView(frame: CGRect(x:100,y:200,width:110,height:150))
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
