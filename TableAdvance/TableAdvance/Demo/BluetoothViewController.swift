//
//  ViewController.swift
//  CoreBluetooth
//
//  Created by fanviwa on 15/4/23.
//  Copyright (c) 2015年 fanviwa. All rights reserved.
//

import UIKit
import MultipeerConnectivity
class BluetoothViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.创建一个中央对象
        let labUI = UILabel(frame: CGRect(x: 50, y: 50, width: 300, height: 50))
        labUI.text = "等待开发！"
        self.view.addSubview(labUI)
    }
}
