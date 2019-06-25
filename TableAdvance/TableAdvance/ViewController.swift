//
//  ViewController.swift
//  主体界面
//
//  Created by 丁莉萍 on 2019/3/15.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    ///主体的列表
    var _tableView : UITableView?
    ///表单的数据
    var _dataArray : [ViewModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo列表"
        
        _dataArray = [ViewModel]()
        
        ///下面是读取App程序集中准备好的数据
        let path = Bundle.main.path(forResource: "viewData", ofType: "plist")
        
        ///读取默认的图片
        var Ipath = Bundle.main.path(forResource: "IMG_2524", ofType: "JPG")
        
        ///通过文件初始化我们的主体程序的运行数据
        let dataArray:NSArray = NSArray.init(contentsOfFile: path!)!
        
        ///遍历数据形成我们的数据列表
        for modelData in dataArray as! [NSMutableDictionary]
        {
            print(modelData)
            let vModel = ViewModel()
            vModel.ModelName = modelData["ViewName"] as? String
            Ipath = Bundle.main.path(forResource: modelData["ViewImage"] as? String, ofType: "JPG")
            vModel.ModelImage = UIImage(contentsOfFile: Ipath!)
            vModel.ModelCodeName = modelData["ViewCode"] as? String
            vModel.ModelDesc = modelData["ViewDesc"] as? String
            _dataArray?.append(vModel)
        }
        _tableView = UITableView(frame : self.view.bounds, style : .plain)
        _tableView?.delegate = self;
        _tableView?.dataSource = self;
        ///将数据列表加载到主体程序中来
        self.view.addSubview(_tableView!)
        
        _tableView?.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
       // _tableView?.separatorColor = UIColor.blue
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    ///每个单元中都加入我们需要的数据
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid  = "cellid"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid) as? ViewCell
        if cell == nil
        {
            cell = ViewCell(style: .default, reuseIdentifier: cellid)
        }
        cell!.model = _dataArray![indexPath.row]
        cell!.fillData()
        return cell!;
    }
    
    ///数据代理需要的数据，返回一共的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataArray!.count
    }
    
    ///这里为行点击事件，这里是整个程序的核心，通过字符串来加载我们的控件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:ViewCell = tableView.cellForRow(at: indexPath) as! ViewCell
        let str = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let ViewName : String = cell.model?.ModelCodeName ?? ""
        let con = NSClassFromString(str + "." + ViewName)  as? UIViewController.Type
        let vc = con?.init()
        self.navigationController?.pushViewController(vc!, animated: true)
  
    }
    
}

