//
//  ViewController.swift
//  TestTask
//
//  Created by Hayk Ghazaryan on 15.09.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var userListViewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        
        userListViewModel.users.bind {[weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        userListViewModel.getData()
    }
    
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.register(UINib(nibName: TableViewCell.id, bundle: nil),  forCellReuseIdentifier: TableViewCell.id)
        tableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        let id = userListViewModel.users.value?[indexPath.row].id
        
        if let userId = id {
            cell.userID.text = String(userId)

        }
 
        cell.userName.text = userListViewModel.users.value?[indexPath.row].username
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Passing data forward without segue
        let vc = DetailsTableViewController(users: userListViewModel.users.value, index: indexPath.row)
        self.present(vc, animated: true)
    }
}


