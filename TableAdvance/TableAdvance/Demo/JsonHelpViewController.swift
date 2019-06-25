//
//  JsonHelpViewController.swift
//  TableAdvance
//
//  Created by 丁莉萍 on 2019/4/17.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import UIKit
//首先定义一个结构体Person用来表示数据Model
struct Person: Codable {
    var name: String?
    var age: Int?
    var sex: String?
}

class cPerson: Codable
{
    var name: String?
    var age: Int?
    var sex: String?
    var Per:Person?
}

class TestPerson{
    public init()
    {
        //1.jsonString中获取数据封装成Model
        let p1String = "{\"name\":\"walden\",\"age\":30,\"sex\":\"man\"}"
        let p1 = Person.decodeJSON(from: p1String)
        
        //2.jsonString中获取数据封装成Array
        let personString = "{\"haha\":[{\"name\":\"walden\",\"age\":30,\"sex\":\"man\"},{\"name\":\"healer\",\"age\":20,\"sex\":\"female\"}]}"
        let persons = [Person].decodeJSON(from: personString, designatedPath: "haha")
        
        //3.对象转jsonString
        let jsonString = p1?.toJSONString()
        
        //4.对象转jsonObject
        let jsonObject = p1?.toJSONObject()
    }
}

class JsonHelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // let tp = TestPerson()
        
        //let p1String = "{\"name\":\"walden\",\"age\":30,\"sex\":\"man\",\"per\":\"{\"name\":\"walden\",\"age\":30,\"sex\":\"man\"}\"}"
       // let p1String = "{\"name\":\"walden\",\"age\":30,\"sex\":\"man\"}"
        //let p1 = cPerson.decodeJSON(from: p1String)
        //print(p1)
        
        let tp = cPerson()
        tp.age = 11
        tp.name = "brian"
        tp.sex = "男"
        tp.Per = Person()
        tp.Per?.age=112
        tp.Per?.name="brian son"
        tp.Per?.sex="女"
        
        let p1 = tp.toJSONString()
        
        let obj = cPerson.decodeJSON(from: p1)
        print(obj)
        
        
    }
   
}
