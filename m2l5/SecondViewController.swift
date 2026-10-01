//
//  SecondViewController.swift
//  m2l5
//
//  Created by AndreyM on 01.10.2026.
//

import UIKit

class SecondViewController: UIViewController {
    
    private lazy var backAction : UIAction = UIAction{[weak self] _ in
        self?.navigationController?.popViewController(animated: true)
    }
    
    
    private lazy var rowItem = settingItem.mockDataFirst()
    
    private lazy var tableView : UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
}

extension SecondViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        
        
        let item : settingItem
        switch indexPath.section {
        case 0: item = rowItem[indexPath.row]
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
            default: return nil
        }
    }
    
}
