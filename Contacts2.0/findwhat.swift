//
//  findwhat.swift
//  Contacts2.0
//
//  Created by 魏新宇 on 16/7/10.
//  Copyright © 2016年 魏新宇. All rights reserved.
//

import Foundation
import UIKit
class findwhat: UIViewController {
    
    @IBOutlet weak var text: UITextField!
    var db:SQLiteDB!
    
    @IBOutlet weak var a: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        
    }
    
    
    @IBAction func findname(sender: AnyObject) {
        find()
    }
    
    func find(){
        a.text=""
        let x=text.text!
        let data = db.query("select * from user where uname='\(x)'")
        //print("sql:\(sql)")
        for(var i=0;i<data.count;i++) {
            let tuser = data[i]
            a.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "邮箱：" + String(tuser["email"]!)+"地址：" + String(tuser["address"]!)  + "\n"
        }
        
    }
    
    @IBAction func findphone(sender: AnyObject) {
        findphone()
    }

    func findphone(){
        a.text=""
        let x=text.text!
        let data = db.query("select * from user where mobile='\(x)'")
        //print("sql:\(sql)")
        for(var i=0;i<data.count;i++) {
            let tuser = data[i]
            a.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "邮箱：" + String(tuser["email"]!)+"地址：" + String(tuser["address"]!) + "\n"
        }
        
    }
    func deletbyphone(){
        let y=text.text!
        let sql = "select from user where mobile='\(y)'"
        print("sql:\(sql)")
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

