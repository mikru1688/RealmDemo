//
//  Temp.swift
//  RealmDemo
//
//  Created by Frank.Chen on 2017/4/29.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class Temp: UIViewController {

    override func viewDidLoad() {
        // 生成訂單
        //        let realm = try! Realm()
        
        //        let order: Order = Order()
        //        order.name = "褲子100件" // 訂單名稱
        //        order.amount = 60000 // 訂單金額
        
        // 新增資料
        //        try! realm.write {
        //            realm.add(order)
        //        }
        
        // 修改資料
        //        let realm = try! Realm()
        //
        //        let order: Order = Order()
        //        order.id = "F2CC1BAE-9570-49C9-8A82-5742F2F263AD"
        //        order.name = "鞋子700雙"
        //        order.amount = 40000
        
        //        try! realm.write {
        //            // 必須有定義key值才能傳入true
        //            realm.add(order, update: true)
        //        }
        
        // 查詢資料
        //        let realm = try! Realm()
        //
        //        let orders = realm.objects(Order.self)
        //
        //        for result in orders {
        //            print("id: \(result.id)")
        //            print("name: \(result.name)")
        //            print("amount: \(result.amount)")
        //        }
        
        // 使用斷言字串查詢條件來過濾資料
        //        let realm = try! Realm()
        //
        //        let orders = realm.objects(Order.self).filter("name = '鞋子700雙'")
        //
        //        for result in orders {
        //            print("id: \(result.id)")
        //            print("name: \(result.name)")
        //            print("amount: \(result.amount)")
        //        }
        
        // 使用NSPredicate查詢條件來過濾資料
        //        let realm = try! Realm()
        //
        //        let predicate = NSPredicate(format: "amount >= %d AND amount <= %d", 20000, 50000)
        //        let orders = realm.objects(Order.self).filter(predicate)
        //
        //        for result in orders {
        //            print("id: \(result.id)")
        //            print("name: \(result.name)")
        //            print("amount: \(result.amount)")
        //        }
        
        
        // 刪除資料
        //        let realm = try! Realm()
        //
        //        let predicate = NSPredicate(format: "amount >= 20000 AND amount <= 50000")
        //        let orders = realm.objects(Order.self).filter(predicate)
        //
        //        try! realm.write {
        //            realm.delete(orders)
        //        }
        
        
        
        // 交易開始
        //        realm.beginWrite()
        
        //        for result in orders {
        //            realm.delete(result)
        //        }        
        
        // 提交數據
        //        try! realm.commitWrite()
        
        // 印出資料庫的位址
//        print("fileURL: \(realm.configuration.fileURL!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
