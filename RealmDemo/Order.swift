//
//  Order.swift
//  RealmDemo
//
//  Created by Frank.Chen on 2017/4/29.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import Foundation
import RealmSwift

class Order: Object {
    
    dynamic var id = UUID().uuidString // key(設置key可以加快查詢的速度)
    dynamic var name = "" // 訂單名稱
    dynamic var amount = 0 // 訂單總金額
    dynamic var createDate = Date() // 建立日期
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
