//
//  MyUIViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/17.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class UIWebViewController: UIViewController {
    
    //添加一个网页视图对象，作为当前类的属性
    var webView:UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获得当前设备的屏幕尺寸信息
        let bounds = UIScreen.main.bounds
        //创建一个矩形的显示区域
        let frame = CGRect(x: 0, y: 40, width: bounds.width, height: bounds.height-40)
        
        //初始化一个网页视图对象，并以矩形区域作为其显示区域
        webView = UIWebView(frame: frame)
        //设置网页视图的背景颜色为无色
        webView.backgroundColor = UIColor.clear
        //将网页视图添加到当前视图控制器的根视图
        self.view.addSubview(webView)
        
        //初始化一个按钮控件，并设置其显示区域。当用户点击该按钮时，将加载并渲染一段网页代码。
        let loadHTML = UIButton(frame: CGRect(x: 40, y: 400, width: 240, height: 44))
        //设置按钮在正常状态下的标题文字
        loadHTML.setTitle("Load Html", for: .normal)
        //设置按钮的背景颜色为棕色
        loadHTML.backgroundColor = UIColor.brown
        //给按钮绑定点击事件
        loadHTML.addTarget(self, action:"loadHTML", for: .touchUpInside)
        
        //创建另一个按钮，当用户点击该按钮时，将加载项目中的Gif动画
        let loadGIF = UIButton(frame: CGRect(x: 40, y: 470, width: 240, height: 44))
        //设置按钮在正常状态下的标题文字
        loadGIF.setTitle("Load Gif", for: .normal)
        //设置按钮的背景颜色为棕色
        loadGIF.backgroundColor = UIColor.brown
        //给按钮绑定点击事件
        loadGIF.addTarget(self, action: "loadGIF", for: .touchUpInside)
        
        //将两个按钮依次添加到当前视图控制器的根视图
        self.view.addSubview(loadHTML)
        self.view.addSubview(loadGIF)
    }
    
    //添加一个方法，用来加载并渲染一段网页代码
    @objc func loadHTML()
    {
        //初始化第一个字符串常量，用来表示一段网页代码。
        //该网页代码用来显示一段文字，并设置文字的颜色为红色，尺寸为30像素
        let team = "<div style='color:#ff0000;font-size:30px;'>Strengthen</div>"
        //初始化第二个字符串常量，用来表示一段网页代码。
        //该网页代码用来显示一行文字，并设置文字中的电话号码的颜色为红色。
        let tel = "<div>Tel:<span style='color:#ff0000'>18812345678</span></div>"
        //初始化第三个字符串常量，该网页代码用来显示一行文字，并设置文字加粗的视觉样式
        let url = "<div><b>Website:https://www.cnblogs.com/strengthen/</b></div>"
        //将三个字符串拼接为一个字符串，
        //拼接后的字符串将作为网页视图的内容。
        let html = team + tel + url
        
        //设置网页视图的检测类型，网页视图将会突出显示符合该类型的内容
        webView.dataDetectorTypes = [UIDataDetectorTypes.link, UIDataDetectorTypes.phoneNumber]
        //调用网页视图读取网页代码的方法，加载刚刚创建的字符串常量
        webView.loadHTMLString(html, baseURL: nil)
    }
    
    //添加一个方法，用来将加载项目中的Gif动画
    @objc func loadGIF()
    {
        //获得项目束的主目录，使网页视图可以加载项目主目录下的资源
        let resourceURL = Bundle.main.resourceURL
        //调用网页视图的加载网页字符串的方法，加载主目录下的Gif文件
        webView.loadHTMLString("<img src='strengthen.gif'>", baseURL: resourceURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


