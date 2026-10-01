//
//  ViewController.swift
//  m2l5
//
//  Created by AndreyM on 29.09.2026.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nextAction : UIAction = UIAction{ _ in
        let next = SecondViewController()
        
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
    private lazy var btn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .white
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        $0.setTitle("next", for: .normal)
        return $0
    }(UIButton(primaryAction: nextAction))
    
    @objc
    func setNextBtn(){
        let next = SecondViewController()
        
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    private lazy var users = settingItem.mockDataFirst()
    private lazy var groups = settingItem.mockDataSecond()
    
    private lazy var tableView : UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            btn.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return users.count
        case 1:
            return groups.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        
        
        let item : settingItem
        switch indexPath.section {
        case 0: item = users[indexPath.row]
        case 1: item = groups[indexPath.row]
        default:
            return cell
        }
        
        var config = cell.defaultContentConfiguration()
        config.text = item.title
        config.image = UIImage(systemName: item.icon)
        config.secondaryText = item.sub
        cell.contentConfiguration = config
        
        cell.accessoryType = .detailDisclosureButton
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
            case 0: return "Users"
            case 1: return "Groups"
            default: return nil
        }
    }
    
}

