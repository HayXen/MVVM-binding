//
//  DetailsTableViewController.swift
//  TestTask
//
//  Created by Hayk Ghazaryan on 15.09.21.
//

import UIKit

class DetailsTableViewController: UIViewController {
    
    @IBOutlet var usernameKey: UILabel!
    @IBOutlet var usernameValue: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var cityName: UILabel!
    
    
    var users: [UserTableViewCellModel]?
    var index: Int
    
    init(users: [UserTableViewCellModel]?, index: Int){
        self.index = index
        self.users = users
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppearance()
    }
    
    func setAppearance() {
        self.usernameValue.text = self.users?[index].username
        self.cityName.text = self.users?[index].address.city
    }
}
