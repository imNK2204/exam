//
//  ViewController.swift
//  exam
//
//  Created by srk on 06/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit
import CoreData

class StudentLoginVC: UIViewController {
    
    private var studArr = [Student]()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "VNSGU Login Penal"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .black
        return label
    }()
    
    private let username: UITextField = {
        let user = UITextField()
        user.placeholder = "Enter Username"
        user.textAlignment = .center
        user.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        user.layer.cornerRadius = 10
        return user
    }()
    
    private let password: UITextField = {
        let pass = UITextField()
        pass.isSecureTextEntry = true
        pass.placeholder = "Enter Password"
        pass.textAlignment = .center
        pass.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        pass.layer.cornerRadius = 10
        return pass
    }()
    
    private let loginButton: UIButton = {
        let login = UIButton()
        login.setTitle("Login", for: .normal)
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        login.addTarget(self, action: #selector(redirect), for: .touchUpInside)
        login.backgroundColor = .red
        login.layer.cornerRadius = 10
        return login
    }()
    
    private let registerButton: UIButton = {
        let login = UIButton()
        login.setTitle("Register", for: .normal)
        login.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        login.addTarget(self, action: #selector(addStudent), for: .touchUpInside)
        login.backgroundColor = .white
        login.setTitleColor(.black, for: .normal)
        login.layer.cornerRadius = 10
        return login
    }()
    
    @objc private func redirect(){
        let studCnt = studArr.count
        
        if(username.text! == "Admin" && password.text! == "Admin"){
            let vc  = AdminVC()
            navigationController?.pushViewController(vc, animated: true)
        }
        else{
            for i in 0..<studCnt{
                if(username.text! == studArr[i].spid! && password.text! == studArr[i].pwd!){
                    let vc = StudentDetailVC()
                    
                    UserDefaults.standard.setValue(username.text, forKey: "spid")
                    UserDefaults.standard.setValue(studArr[i].name, forKey: "name")
                    navigationController?.pushViewController(vc, animated: true)
                    break
                }else if (username.text == "" && password.text == "") || (username.text != studArr[i].spid! && password.text != studArr[i].pwd!){
                    let alert = UIAlertController(title: "Login Error", message: "Please enter correct credentials!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Close", style: .cancel))
                    DispatchQueue.main.async {
                        self.present(alert, animated: true){
                            self.username.text = ""
                            self.password.text = ""
                        }
                    }
                }
            }
        }
    }
    
    @objc private func addStudent(){
        let alert = UIAlertController(title: "Register Student", message: "Enter your details here..", preferredStyle: .alert)
        alert.addTextField{(tf) in
            tf.placeholder = "SPID"
        }
        alert.addTextField{(tf) in
            tf.placeholder = "Password"
        }
        alert.addTextField{(tf) in
            tf.placeholder = "Name"
        }
        alert.addTextField{(tf) in
            tf.placeholder = "Department"
        }
        let action = UIAlertAction(title: "Register", style: .default){ (_) in
            guard let spid = alert.textFields?[0].text,
                  let pwd = alert.textFields?[1].text,
                  let name = alert.textFields?[2].text,
                  let dept = alert.textFields?[3].text
            else {
                return
            }
            CoreDataHandler.shared.insert(spid: spid, pwd: pwd, name: name, dept: dept){[weak self] in
                let vc = StudentLoginVC()
                print(spid)
                print(pwd)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VNSGU App"
        view.addSubview(label)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        studArr = CoreDataHandler.shared.fetch()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 20, y: 180, width: view.width - 40, height: 60)
        username.frame = CGRect(x: 20, y: label.bottom + 20, width: view.width - 40, height: 60)
        password.frame = CGRect(x: 20, y: username.bottom + 20, width: view.width - 40, height: 60)
        loginButton.frame = CGRect(x: 20, y: password.bottom + 20, width: view.width - 40, height: 60)
        registerButton.frame = CGRect(x: 20, y: loginButton.bottom + 20, width: view.width - 40, height: 40)
    }


}

