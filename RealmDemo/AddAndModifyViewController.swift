//
//  AddAndModifyViewController.swift
//  RealmDemo
//
//  Created by Frank.Chen on 2017/4/29.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit
import RealmSwift

class AddAndModifyViewController: UIViewController {
    
    var isFromAdd: Bool = false
    var order: Order?
    var viewController: ViewController!
    @IBOutlet weak var addOrModifybtn: UIButton!
    @IBOutlet weak var orderNameTxt: UITextField!
    @IBOutlet weak var orderAmountTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定title名稱
        if self.isFromAdd {
            self.navigationItem.title = "新增"
            self.addOrModifybtn.setTitle("新增", for: .normal)
        } else {
            self.navigationItem.title = "修改"
            self.addOrModifybtn.setTitle("修改", for: .normal)
            self.orderNameTxt.text = self.order?.name
            self.orderAmountTxt.text = "\((self.order?.amount)!)"
        }
    }
    
    // 新增或修改
    @IBAction func goAddOrModify(_ sender: Any) {
        // 驗證訂單名稱和訂單金額是否有輸入
        if self.orderNameTxt.text! == "" && self.orderAmountTxt.text! == "" {
            self.showMsg("請輸入訂單名稱和訂單金額", showMsgStatus: .loginFail, handler: nil)
            return
        }
        
        let realm = try! Realm()
        let order: Order = Order()
        
        if self.isFromAdd {
            order.name = self.orderNameTxt.text! // 訂單名稱
            order.amount = Int(self.orderAmountTxt.text!)! // 訂單金額
                        
            try! realm.write {
                realm.add(order)
            }
        } else {
            // 修改
            order.id = (self.order?.id)!
            order.name = self.orderNameTxt.text! // 訂單名稱
            order.amount = Int(self.orderAmountTxt.text!)! // 訂單金額
            
            try! realm.write {
                realm.add(order, update: true)
            }
        }
        
        self.viewController.reloadData()
        _ = self.navigationController?.popViewController(animated: true)
    }

}
