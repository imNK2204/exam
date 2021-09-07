//
//  AdminVC.swift
//  exam
//
//  Created by srk on 07/09/21.
//  Copyright © 2021 Nikunj. All rights reserved.
//

import UIKit

class AdminVC: UIViewController {
    
    private let studButton: UIButton = {
        let button = UIButton()
        button.setTitle("Student Details", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = #colorLiteral(red: 0.8915841755, green: 0.8915841755, blue: 0.8915841755, alpha: 1)
        button.addTarget(self, action: #selector(gotoSdVc), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        return button
    }()
    
    @objc private func gotoSdVc(){
        let vc = AstudDetailVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let noticeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Notice Details", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = #colorLiteral(red: 0.8915841755, green: 0.8915841755, blue: 0.8915841755, alpha: 1)
        button.addTarget(self, action: #selector(gotoNdVc), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        return button
    }()
    
    @objc private func gotoNdVc(){
        let vc = ANoticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Admin Penal"
        view.addSubview(studButton)
        view.addSubview(noticeButton)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        studButton.frame = CGRect(x: 20, y: 180, width: view.width - 40, height: 80)
        noticeButton.frame = CGRect(x: 20, y: studButton.bottom + 40, width: view.width - 40, height: 80)
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
