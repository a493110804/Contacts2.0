//
//  ViewController.swift
//  Contacts2.0
//
//  Created by 魏新宇 on 16/7/10.
//  Copyright © 2016年 魏新宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //initUser()
    }
    

    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    func initUser(){
        let data = db.query("select * from user")
        if data.count > 0{
            let user = data[data.count - 1]
            phone.text = user["mobile"] as? String
            name.text = user["uname"] as? String
            email.text = user["email"] as? String
            address.text = user["address"] as? String
        }
    }
    func saveUser() {
        let uname = self.name.text!
        let mobile = self.phone.text!
        let email = self.email.text!
        let address = self.address.text!
        let sql = "insert into user(uname,mobile,email,address) values('\(uname)','\(mobile)','\(email)','\(address)')"
        let result = db.execute(sql)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}


