//
//  StudentDetailVC.swift
//  exam
//
//  Created by srk on 07/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class StudentDetailVC: UIViewController {
    
    let name = UserDefaults.standard.string(forKey: "name")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome " + name!
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
}
