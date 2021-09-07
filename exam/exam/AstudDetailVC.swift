//
//  AstudDetailVC.swift
//  exam
//
//  Created by srk on 07/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class AstudDetailVC: UIViewController {
    
    private var studArr = [Student]()
    private var studTable = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        studArr = CoreDataHandler.shared.fetch()
        studTable.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Student Details"
        view.backgroundColor = .white
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStud))
        navigationItem.setRightBarButton(addItem, animated: true)
        view.addSubview(studTable)
        studTable.register(UITableViewCell.self, forCellReuseIdentifier: "stud")
        studTable.delegate = self
        studTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @objc func addStud(){
        let alert = UIAlertController(title: "Add New Student", message: "Enter new student details", preferredStyle: .alert)
        alert.addTextField{ (tf) in
            tf.placeholder = "SPID"
        }
        alert.addTextField{ (tf) in
            tf.placeholder = "Password"
        }
        alert.addTextField{ (tf) in
            tf.placeholder = "Name"
        }
        alert.addTextField{ (tf) in
            tf.placeholder = "Department"
        }
        let action = UIAlertAction(title: "Add", style: .default){ (_) in
            guard let spid = alert.textFields?[0].text,
                  let pwd = alert.textFields?[1].text,
                  let name = alert.textFields?[2].text,
                  let dept = alert.textFields?[3].text
                else{
                    return
            }
            CoreDataHandler.shared.insert(spid: spid, pwd: pwd, name: name, dept: dept){
                [weak self] in
                let vc = AstudDetailVC()
                self?.navigationController?.pushViewController(vc, animated: false)
            }
        }
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        studTable.frame = view.bounds
    }

}

extension AstudDetailVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stud", for: indexPath)
        let stud = studArr[indexPath.row]
        cell.textLabel?.text = "\(stud.spid!) \t | \t \(stud.pwd!) \t | \t \(stud.name!) \t | \t \(stud.dept!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let stud = studArr[indexPath.row]
        CoreDataHandler.shared.delete(stud: stud){ [weak self] in
            self?.studArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Update Student Record", message: "You can change your details", preferredStyle: .alert)
        let stud = studArr[indexPath.row]
        alert.addTextField{ (tf) in
            tf.text = "\(String(stud.spid!))"
        }
        alert.addTextField{ (tf) in
            tf.text = "\(String(stud.pwd!))"
        }
        alert.addTextField{ (tf) in
            tf.text = "\(String(stud.name!))"
        }
        alert.addTextField{ (tf) in
            tf.text = "\(String(stud.dept!))"
        }
        let action = UIAlertAction(title: "Update", style: .default){ (_) in
            guard let spid = alert.textFields?[0].text,
                  let pwd = alert.textFields?[1].text,
                  let name = alert.textFields?[2].text,
                  let dept = alert.textFields?[3].text
                else{
                    return
            }
            
            CoreDataHandler.shared.update(stud: stud, spid: spid, pwd: pwd, name: name, dept: dept){ [weak self] in
                let vc = AstudDetailVC()
                self?.navigationController?.pushViewController(vc, animated: false)
            }
        }
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
