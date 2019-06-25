//
//  CustomCellViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/3/16.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit

//class CustomCellViewController : UIViewController,UITableViewDelegate,UITableViewDataSource
//{
//
//
//    var _tableView : UITableView?
//    var _dataArray : [BookModel]?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "书籍列表"
//
//        _dataArray = [BookModel]()
//
//        let path = Bundle.main.path(forResource: "bookData", ofType: "plist")
//
//        let dataArray:NSArray = NSArray.init(contentsOfFile: path!)!
//
//        for bookData in dataArray as! [NSMutableDictionary]
//        {
//            print(bookData)
//            let book = BookModel()
//
//            book.bookName = bookData["title"] as? String
//            book.bookImage = UIImage(named : bookData["icon"] as! String)
//            book.bookPrice = bookData["price"] as? String
//            book.bookDesc = bookData["detail"] as? String
//            _dataArray?.append(book)
//        }
//
//        _tableView = UITableView(frame : self.view.bounds, style : .plain)
//        _tableView?.delegate = self;
//        _tableView?.dataSource = self;
//        self.view.addSubview(_tableView!)
//
//        _tableView?.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
//        _tableView?.separatorColor = UIColor.blue
//    }
//
////    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath)-> CGFloat
////    {
////        return 80
////    }
//
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellid  = "cellid"
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellid) as? BookCell
//        if cell == nil
//        {
//            cell = BookCell(style: .default, reuseIdentifier: cellid)
//        }
//        cell!.model = _dataArray![indexPath.row]
//        cell!.fillData()
//        return cell!;
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       return _dataArray!.count
//    }
//
//}
