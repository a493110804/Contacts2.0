//
//  Find.swift
//  Contacts2.0
//
//  Created by 魏新宇 on 16/7/10.
//  Copyright © 2016年 魏新宇. All rights reserved.
//

import Foundation
import UIKit
class find: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var all: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        
    }
    
    @IBAction func tofind(sender: AnyObject) {
        selete()
    }
    func selete(){
        all.text = ""
        let data = db.query("select * from user")
        for var x=0;x<data.count;x++ {
            let tuser = data[x]
            all.text! += "姓名：" + String(tuser["uname"]!) + "手机：" + String(tuser["mobile"]!)  + "邮箱：" + String(tuser["email"]!)+"地址：" + String(tuser["address"]!)+"\n"
        }
    }
    
    @IBAction func alldelet(sender: AnyObject) {
        let sql = "delete from user"
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

