//
//  Models.swift
//  ACNoonbody
//
//  Created by DevKang on 2017. 6. 10..
//  Copyright © 2017년 DevKang. All rights reserved.
//

import RealmSwift

class User: Object {
    dynamic var id = UUID().uuidString
    dynamic var name:String? = nil
    var height:Int? = nil
    var weight:Float? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
