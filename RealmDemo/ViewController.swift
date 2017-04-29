//
//  ViewController.swift
//  RealmDemo
//
//  Created by Frank.Chen on 2017/4/29.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var orderList: Results<Order>!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.edgesForExtendedLayout = []
        
        // 查詢資料
        let realm = try! Realm()
        self.orderList = realm.objects(Order.self)
    }
    
    // MARK: - DataSource
    // ---------------------------------------------------------------------
    // 設定表格section的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    // 表格的儲存格設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }
        
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.textLabel?.text = self.orderList[indexPath.row].name
        cell?.detailTextLabel?.text = "$\(self.orderList[indexPath.row].amount)"
        
        return cell!
    }
    
    // MARK: - Delegate
    // ---------------------------------------------------------------------
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 刪除資料
            let realm = try! Realm()
            let predicate = NSPredicate(format: "id = %@ ", self.orderList[indexPath.row].id)
            let orders = realm.objects(Order.self).filter(predicate)
            
            try! realm.write {
                realm.delete(orders)
            }
            
            self.tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            self.reloadData()
        }
    }
    
    
    // MARK: - Callback
    // ---------------------------------------------------------------------
    @IBAction func goAdd(_ sender: Any) {        
        self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addAndModifyViewController: AddAndModifyViewController = segue.destination as! AddAndModifyViewController
        
        // 新增
        if segue.identifier == "addSegue" {
            addAndModifyViewController.isFromAdd = true
        }
        
        // 修改
        if segue.identifier == "editSegue" {
            addAndModifyViewController.isFromAdd = false
            addAndModifyViewController.order = self.orderList[(tableView.indexPathForSelectedRow?.row)!]
        }
        
        addAndModifyViewController.viewController = self
    }
    
    // 重新查詢資料
    func reloadData() {
        let realm = try! Realm()
        self.orderList = realm.objects(Order.self)
        self.tableView.reloadData()
    }
}

extension UIViewController {
    // 提示錯誤訊息
    func showMsg(_ message: String, showMsgStatus: ShowMsgStatus, handler: (() -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let cancel: UIAlertAction!
        
        switch showMsgStatus {
        case .loginSuccess:
            cancel = UIAlertAction(title: "確定", style: .default) { action in
                handler!()
            }
        default:
            cancel = UIAlertAction(title: "確定", style: .default, handler: nil)
        }
        
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    enum ShowMsgStatus {
        case loginSuccess
        case loginFail
    }
}

