//
//  RealmUtils.swift
//  RealmDemo
//
//  Created by Frank.Chen on 2017/4/29.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit
import RealmSwift

class RealmDao: NSObject {
    
    static let shared = RealmDao()
    private var realm: Realm!
        
    private override init() {
        self.realm = try! Realm()
    }
    
    func getRealmObject() -> Realm {
        return self.realm
    }
}
