//
//  RealmDB.swift
//  ACNoonbody
//
//  Created by DevKang on 2017. 6. 10..
//  Copyright © 2017년 DevKang. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class LocalDB: NSObject {
    static let shared = LocalDB()
    
    fileprivate var userDB:Realm
    
    override init() {
        do {
            var config = Realm.Configuration()
            let taskDBPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/task.realm"
            config.schemaVersion = 0
            config.fileURL = URL(fileURLWithPath: taskDBPath)
            config.migrationBlock = { migration, oldSchemaVersion in
                if oldSchemaVersion < 0 {
                    
                }
            }
            
            self.userDB = try Realm(configuration: config)
        } catch(let error) {
            fatalError(String(describing: error))
        }
    }
    
    func currentUser() -> Observable<User?> {
        return Observable.create { observer in
            if let user = self.userDB.objects(User.self).first {
                observer.onNext(user)
            } else {
                let first = User()
                do {
                    first.name = "testNameName"
                    try self.userDB.write {
                        self.userDB.add(first)
                    }
                    observer.onNext(first)
                } catch(let error) {
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
