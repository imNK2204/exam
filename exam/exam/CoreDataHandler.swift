//
//  CoreDataHandler.swift
//  exam
//
//  Created by srk on 06/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreDataHandler{
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedobjectContext: NSManagedObjectContext?
    
    private init(){
        managedobjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        appDelegate.saveContext()
    }
    
    func insert(spid:String, pwd:String, name:String, dept:String, completion: @escaping() -> Void) {
        let stud = Student(context: managedobjectContext!)
        stud.spid = spid
        stud.pwd = pwd
        stud.name = name
        stud.dept = dept
        save()
        completion()
    }
    
    func update(stud: Student, spid:String, pwd:String, name:String, dept:String, completion: @escaping() -> Void) {
        stud.spid = spid
        stud.pwd = pwd
        stud.name = name
        stud.dept = dept
        save()
        completion()
    }
    
    func delete(stud:Student, completion: @escaping () -> Void)
    {
        managedobjectContext!.delete(stud)
        save()
        completion()
    }
    
    func updatepwd(stud: Student, pwd:String, completion: @escaping() -> Void){
        stud.pwd = pwd
        save()
        completion()
    }
    
    func fetch() -> [Student] {
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let studArr = try managedobjectContext?.fetch(fetchRequest)
            return studArr!
        }catch{
            print(error)
            let studArr = [Student]()
            return studArr
            
        }
    }
}
