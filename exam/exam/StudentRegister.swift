//
//  StudentRegister.swift
//  exam
//
//  Created by srk on 06/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class StudentRegister: UIViewController {
    
    private let label: UILabel = {
        let registerLabel = UILabel()
        registerLabel.text = "Register"
        registerLabel.textAlignment = .center
        registerLabel.font = UIFont.boldSystemFont(ofSize: 40)
        registerLabel.textColor = .black
        return registerLabel
    }()
    
    private let spidTextfield: UITextField = {
        let spid = UITextField()
        spid.placeholder = "Enter spid here.."
        spid.textAlignment = .center
        spid.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        spid.layer.cornerRadius = 10
        spid.font = UIFont.boldSystemFont(ofSize: 20)
        return spid
    }()
    
    private let nameTextfield: UITextField = {
        let spid = UITextField()
        spid.placeholder = "Enter name here.."
        spid.textAlignment = .center
        spid.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        spid.layer.cornerRadius = 10
        spid.font = UIFont.boldSystemFont(ofSize: 20)
        return spid
    }()
    
    private let pwdTextfield: UITextField = {
        let spid = UITextField()
        spid.placeholder = "Enter password here.."
        spid.textAlignment = .center
        spid.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        spid.isSecureTextEntry = true
        spid.layer.cornerRadius = 10
        spid.font = UIFont.boldSystemFont(ofSize: 20)
        return spid
    }()
    
    private let deptTextfield: UITextField = {
        let spid = UITextField()
        spid.placeholder = "Enter department here.."
        spid.textAlignment = .center
        spid.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        spid.layer.cornerRadius = 10
        spid.font = UIFont.boldSystemFont(ofSize: 20)
        return spid
    }()
    
    private let registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Register", for: .normal)
        
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Student Register"
        view.addSubview(label)
        view.addSubview(spidTextfield)
        view.addSubview(nameTextfield)
        view.addSubview(pwdTextfield)
        view.addSubview(deptTextfield)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 20, y: 180, width: view.width - 40, height: 60)
        spidTextfield.frame = CGRect(x: 20, y: label.bottom + 20, width: view.width - 40, height: 40)
        nameTextfield.frame = CGRect(x: 20, y: spidTextfield.bottom + 20, width: view.width - 40, height: 40)
        pwdTextfield.frame = CGRect(x: 20, y: nameTextfield.bottom + 20, width: view.width - 40, height: 40)
        deptTextfield.frame = CGRect(x: 20, y: pwdTextfield.bottom + 20, width: view.width - 40, height: 40)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
