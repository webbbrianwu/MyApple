//
//  ViewBackgroundViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/17.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class ViewBackgroundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView(frame: CGRect(x: 10, y: 60, width: 50, height: 50))
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        
        let alphaView = UIView(frame: CGRect(x: 100, y: 60, width: 50, height: 50))
        alphaView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 1, alpha: 0.5)
        self.view.addSubview(alphaView)
        
        let picView = UIView(frame: CGRect(x: 50, y: 140, width: 121, height: 121))
        picView.backgroundColor = UIColor(patternImage: UIImage(named: "IMG_2524.JPG")!)
        self.view.addSubview(picView)
       
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
