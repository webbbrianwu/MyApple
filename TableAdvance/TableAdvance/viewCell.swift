//
//  BookCell.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/15.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit
//class BookCell: UITableViewCell{
//    var model:BookModel?
//    var bookImage :UIImageView?
//    var bookName:UILabel?
//    var bookPrice:UILabel?
//    var bookDesc:UILabel?
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        bookImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))
//        bookName = UILabel(frame: CGRect(x: 80, y: 10, width: 200, height: 15))
//        bookPrice = UILabel(frame: CGRect(x: 80, y: 30, width: 200, height: 15))
//        bookDesc = UILabel(frame: CGRect(x: 80, y: 50, width: 200, height: 15))
//
//
//        self.contentView.addSubview(bookImage!)
//        self.contentView.addSubview(bookName!)
//        self.contentView.addSubview(bookPrice!)
//        self.contentView.addSubview(bookDesc!)
//
//        bookPrice?.font = UIFont.systemFont(ofSize: 12)
//        bookPrice?.textColor = UIColor.lightGray
//
//        bookDesc?.font = UIFont.systemFont(ofSize: 13)
//        bookDesc?.numberOfLines = 0
//        bookDesc?.textColor = UIColor.darkGray
//
//    }
//
//    func fillData()
//    {
//        bookImage?.image = model?.bookImage
//        bookName?.text = model?.bookName
//        bookPrice?.text = model?.bookPrice
//        bookDesc?.text = model?.bookDesc
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(code:) has not been impemnetedß")
//    }
//}

class ViewCell: UITableViewCell{
    var model:ViewModel?
    var ViewImage :UIImageView?
    var ViewName:UILabel?
    var ViewDesc:UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        ViewImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))
        ViewName = UILabel(frame: CGRect(x: 80, y: 10, width: 200, height: 15))
        ViewDesc = UILabel(frame: CGRect(x: 80, y: 50, width: 200, height: 15))
        
        
        self.contentView.addSubview(ViewImage!)
        self.contentView.addSubview(ViewName!)
        self.contentView.addSubview(ViewDesc!)
        
      
        
        ViewDesc?.font = UIFont.systemFont(ofSize: 13)
        ViewDesc?.numberOfLines = 0
        ViewDesc?.textColor = UIColor.darkGray
        
    }
    
    func fillData()
    {
        ViewImage?.image = model?.ModelImage
        ViewName?.text = model?.ModelName
        ViewDesc?.text = model?.ModelDesc
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been impemnetedß")
    }
}

