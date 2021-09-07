//
//  CoreNoticeHandler.swift
//  exam
//
//  Created by srk on 07/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreNoticeHandler
{
    static let shared = CoreNoticeHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedobjectcontext: NSManagedObjectContext?
    
    private init(){
        managedobjectcontext = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        appDelegate.saveContext()
    }
    
    func insert(title: String, subtitle: String, completion: @escaping() -> Void){
        let nt = Notice(context: managedobjectcontext!)
        nt.title = title
        nt.subtitle = subtitle
        save()
        completion()
    }
    
    func update(nt: Notice, title: String, subtitle: String, completion: @escaping() -> Void){
        nt.title = title
        nt.subtitle = subtitle
        save()
        completion()
    }
    
    func fetch() -> [Notice] {
        let fetchRequest: NSFetchRequest<Notice> = Notice.fetchRequest()
        do{
            let ntArr = try managedobjectcontext?.fetch(fetchRequest)
            return ntArr!
        }catch{
            print(error)
            let ntArr = [Notice]()
            return ntArr
        }
    }
}
