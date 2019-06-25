//
//  MultipeerConnectivityViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/29.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit
import MultipeerConnectivity


class OperaType: Codable
{
    var Operationname: String?
    var Color: String?
 }

class MultipeerConnectivityViewController: UIViewController {

    let cmdService = MClassService()
    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame:CGRect(x: 10, y: 150, width: 300, height: 40))
        label.text = "多点通讯测试例子："
        self.view.addSubview(label)
    
        var btn = UIButton.init(type: .custom) as UIButton
        btn.frame = CGRect(x: 10, y: 200, width: 100, height: 50)
        btn.titleLabel?.text="测试"
        btn.setTitle("红色", for: .normal)
        btn.backgroundColor = UIColor.red
        //btn.addTarget(self, action: #selector(btnCmd), for: .touchUpInside)
        btn.addTarget(self, action:"btnsCmd:", for: .touchUpInside)
        self.view.addSubview(btn)
        
        btn = UIButton.init(type: .custom) as UIButton
        btn.frame = CGRect(x: 120, y: 200, width: 100, height: 50)
        btn.titleLabel?.text="测试"
        btn.setTitle("绿色", for: .normal)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action:"btnsCmd:", for: .touchUpInside)
        self.view.addSubview(btn)
        cmdService.delegate = self
        // Do any additional setup after loading the view.
    }
    func change(color : UIColor) {
        UIView.animate(withDuration: 0.2, animations: { self.view.backgroundColor = color})
    }
   
    
    
    
    @objc func btnCmd()
    {
       
        let alertController = UIAlertController(title: "系统提示",message: "您确定要离开hangge.com吗？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func btnsCmd(_ btn : UIButton)
    {
       // print(btn.currentTitle)
        let showMessage = "确定颜色："+btn.currentTitle!
        let alertController = UIAlertController(title: "系统提示",message: showMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
           // self.CMDChanged(manager: self.cmdService, CMDString: btn.currentTitle!)
        //self.change(color: <#T##UIColor#>)
            
            switch btn.currentTitle
            {
            case "红色":
                self.change(color: .red)
                break
            case "绿色":
                self.change(color: .green)
                break
            default:
                NSLog("%@", "Unknown color value received: \(btn.currentTitle)")
            }
            
           //self.cmdService.send(StrCMD: btn.currentTitle!)
            
            var Opare = OperaType()
            Opare.Operationname = "变色"
            Opare.Color = btn.currentTitle
            var strJson = Opare.toJSONString()
            self.cmdService.sendJson(StrCMD : strJson!)
        })
          alertController.addAction(cancelAction)
         alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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

extension MultipeerConnectivityViewController : MClassServiceDelegate
{
    func NoticeClient(manager: MClassService) {
        OperationQueue.main.addOperation {
            //var strClient = ""
            for  aPeer in manager.session.connectedPeers
            {
               
            }
        }
    }
    func CMDChanged(manager: MClassService, CMDString: String) {
       
        OperationQueue.main.addOperation {
            switch CMDString {
            case "红色":
                self.change(color: .red)
            case "绿色":
                self.change(color: .green)
            default:
                NSLog("%@", "Unknown color value received: \(CMDString)")
            }
        }
    }
    func connectedDevicesChanged(manager: MClassService, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.label.text = "Connections:\(connectedDevices)"
        }
    }
}
