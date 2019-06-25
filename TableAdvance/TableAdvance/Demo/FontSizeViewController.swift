//
//  FontSizeViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/18.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class FontSizeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame:CGRect(x: 10, y: 150, width: 300, height: 40))
        label.text = "唐人教育 - 中国最大的互联网人才服务提供商"
        label.backgroundColor = UIColor.lightGray
        self.view.addSubview(label)
        
        let label1 = UILabel(frame:CGRect(x: 10, y: 200, width: 300, height: 40))
        label1.text = "1唐人教育 - 中国最大的互联网人才服务提供商"
        label1.backgroundColor = UIColor.lightGray
        label1.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label1)
        
        let label2 = UILabel(frame:CGRect(x: 10, y: 250, width: 300, height: 40))
        label2.text = "2唐人教育 - 中国最大的互联网人才服务提供商"
        label2.minimumScaleFactor = 0.8
        label2.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(label2)

        // Do any additional setup after loading the view.
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
