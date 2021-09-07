//
//  ANoticeVC.swift
//  exam
//
//  Created by srk on 07/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class ANoticeVC: UIViewController {
    
    private var ntArr = [Notice]()
    private var ntTable = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        ntArr = CoreNoticeHandler.shared.fetch()
        ntTable.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notice Details"
        view.addSubview(ntTable)
        ntTable.register(UITableViewCell.self, forCellReuseIdentifier: "notice")
        ntTable.delegate = self
        ntTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ntTable.frame = view.bounds
    }

}

extension ANoticeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ntArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nt = ntArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "notice", for: indexPath)
        cell.textLabel?.text = "\(nt.title) \n \(nt.subtitle)"
        return cell
    }
    
    
    
    
}
