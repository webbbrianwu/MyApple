//
//  CircleViewViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/21.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

class ColorUtils
{
    static func randomColor() -> UIColor
    {
        let color: UIColor = UIColor.init(red: (((CGFloat)((arc4random() % 256)) / 255.0)), green: (((CGFloat)((arc4random() % 256)) / 255.0)), blue: (((CGFloat)((arc4random() % 256)) / 255.0)), alpha: 1.0);
        return color;
    }
}

enum ScreenType
{
    case Width320
    case Width375
    case Width414
    case Width768
    case Width1024
}

class ScreenUtils
{
    static func screenWidthModel() ->ScreenType
    {
        let iOSDeviceScreenSize: CGSize = UIScreen.main.bounds.size
        var sType: ScreenType = ScreenType.Width320
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) {
            
            //判断是否为竖屏
            if (iOSDeviceScreenSize.height > iOSDeviceScreenSize.width){
                if(iOSDeviceScreenSize.height == 568){
                   sType = ScreenType.Width320
                } else if (iOSDeviceScreenSize.height == 667){
                    sType = ScreenType.Width375
                } else if (iOSDeviceScreenSize.height == 736){
                     sType = ScreenType.Width414
                } else if (iOSDeviceScreenSize.height == 812){
                    sType = ScreenType.Width768
                } else if (iOSDeviceScreenSize.height == 896){
                     sType = ScreenType.Width1024
                } else {
                    sType = ScreenType.Width320
                }
            }
            
            if (iOSDeviceScreenSize.width > iOSDeviceScreenSize.height){
                if(iOSDeviceScreenSize.width == 568){
                     sType = ScreenType.Width320
                } else if (iOSDeviceScreenSize.width == 667){
                     sType = ScreenType.Width375
                } else if (iOSDeviceScreenSize.width == 736){
                     sType = ScreenType.Width414
                } else if (iOSDeviceScreenSize.width == 812){
                    sType = ScreenType.Width768
                } else if (iOSDeviceScreenSize.width == 896){
                     sType = ScreenType.Width1024
                } else {
                    sType = ScreenType.Width320
                }
            }
        }
           return sType
    }
}
        
        
        
        
   
class Circle {
    
   
    
    // MARK: Properties
    static var minRadius: Int {

        switch ScreenUtils.screenWidthModel() {
        
        case .Width320, .Width375, .Width414:
            return 20
        case .Width768:
            return 40
        case .Width1024:
            return 60
        }
    }
    static var maxRadius: Int {
        switch ScreenUtils.screenWidthModel() {
        case .Width320, .Width375, .Width414:
            return 50
        case .Width768:
            return 100
        case .Width1024:
            return 150
        }
    }
    var color: UIColor
    let radius: Int
    let center: CGPoint
    
    init(color:UIColor, radius:Int, center:CGPoint){
        self.color = color
        self.radius = radius
        self.center = center
    }

    
class func randomCircle() -> Circle {
        
        let screenRect = UIScreen.main.bounds
        let screenWidth:CGFloat = screenRect.width
        let screenHeight:CGFloat = screenRect.height
        let randomRadius = minRadius + Int(arc4random_uniform(UInt32(maxRadius - minRadius + 1)))
        
        let areaWidth = Int(screenWidth) - (randomRadius << 1);
        let areaHeight = Int(screenHeight) - (randomRadius << 1) - 20;
        
        let x = randomRadius + Int(arc4random_uniform(100000)) % areaWidth
        let y = 20 + randomRadius + Int(arc4random_uniform(100000)) % areaHeight // below the status bar
        let randomPoint = CGPoint(x: x, y: y)
        
       
        let randomColor = ColorUtils.randomColor()
        let circle = Circle(color: randomColor, radius: randomRadius, center: randomPoint)
        return circle
    }
    
}

class CircleFactory: NSObject{
    
    // MARK: Properties
    static let MaxCircleCount = 40
    static let sharedCircleFactory = CircleFactory()
    let RadiusGap:Float = 10
    
    var circles = [Circle]()
    
    private override init() {
        self.circles.removeAll()
    }
    
    func  Clear()
    {
        self.circles.removeAll()
    }
    
    func addCircle() {
        while true {
            let aCircle = Circle.randomCircle()
            if isCircleAvailable(aCircle:aCircle) {
                self.circles.append(aCircle)
                break
            }
            continue
        }
    }
    
    func isCircleAvailable(aCircle: Circle) -> Bool {
        for circle in self.circles {
            let distance = hypotf(
                Float(aCircle.center.x - circle.center.x),
                Float(aCircle.center.y - circle.center.y))
            let radiusLength = Float(aCircle.radius + circle.radius)
            if distance <= radiusLength + RadiusGap {
                return false
            }
        }
        return true
    }
}

class CircleView: UIView {
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(circle: Circle) {
        let frame = CGRect(x:0,y:0,width:CGFloat(circle.radius*2),height:CGFloat(circle.radius*2))
        super.init(frame: frame)
        self.backgroundColor = circle.color
        self.center = circle.center
        self.layer.cornerRadius = CGFloat(circle.radius)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
class CircleViewController: UIViewController {
    ///最后一个圆形控件
    var  lastCircleView : CircleView?
    ///圆形控件集合
    var   circleViews = [CircleView]()
    ///点击事件的按钮
    var   Btn = UIButton(frame: CGRect(x: 100, y: 400, width: 200, height: 40))
    /// 提示积分
    var  LLabel = UILabel(frame: CGRect(x: 80, y: 300, width: 200, height: 40))
    ///当前分数
    var  iScore : Int = 0
    ///是否可以点击
    var touched = true
    ///间隙的距离
    var tolerance:CGFloat = 20
    
    func NewRound()
    {
        CircleFactory.sharedCircleFactory.Clear()
        for ccle in circleViews
        {
            ccle.removeFromSuperview()
        }
        iScore = 0
        LLabel.text = ""
        lastCircleView = nil
        SelectEvent(Btn)
    }
    
    @objc func finishEvent(_ button:UIButton) {
      
        self.touched = true
        NewRound()
    }
    
    func ShowFinish()
    {
        LLabel.text = "你的分数为:" + String(iScore)
        self.view.addSubview(LLabel)
        Btn.setTitle("重新开始", for:.normal)
        Btn.addTarget(self, action: #selector(finishEvent(_ :)), for: .touchUpInside)
        self.touched = false
        self.view.addSubview(Btn)
    }
    
    
    
    @objc func SelectEvent(_ button:UIButton)
    {
        Btn.removeFromSuperview()
        CircleFactory.sharedCircleFactory.addCircle()
        for circle in CircleFactory.sharedCircleFactory.circles {
            let color = ColorUtils.randomColor()
            circle.color = color
            let cv = CircleView(circle: circle)
            
            if circle === CircleFactory.sharedCircleFactory.circles.last! {
                self.lastCircleView = cv
            }
            self.view.addSubview(cv)
            circleViews.append(cv)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        Btn.backgroundColor = UIColor.red
        Btn.setTitle("开始游戏", for: .normal)
    
        Btn.addTarget(self, action: #selector(SelectEvent(_:)), for: .touchUpInside)
        self.view.addSubview(Btn)

    }
    
  
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touched {
            let touch = touches.first!
            let point = touch.location(in: self.view)
            let sizeSide = CGFloat(CircleFactory.sharedCircleFactory.circles.last!.radius) + tolerance
            var roundedRect = lastCircleView?.frame
        
            roundedRect?.origin.x -= tolerance
            roundedRect?.origin.y -= tolerance
            roundedRect?.size.width += 2*tolerance
            roundedRect?.size.height += 2*tolerance
            
            let maskPath = UIBezierPath(roundedRect: roundedRect!, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: sizeSide, height: sizeSide))
            
            
            if maskPath.contains(point){
                // go to next round
                print("go to next round")
                iScore += 1
                self.view.backgroundColor = CircleFactory.sharedCircleFactory.circles.last?.color
                self.SelectEvent(Btn)
            } else {
                // go to game over
                print("go to game over")
                touched = false
                ShowFinish()
            }
            
        }
    }

}
