//
//  UserListViewModel.swift
//  TestTask
//
//  Created by Hayk Ghazaryan on 16.09.21.
//

import Foundation


struct UserListViewModel {  
    var users: Observable<[UserTableViewCellModel]> = Observable([])
    
    func getData() {
        
        let urlWithPath = "https://jsonplaceholder.typicode.com/users"

        
        guard let url = URL(string: urlWithPath) else {return}
        
      //  guard let unWrappedApi = api else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {
                return
            }
            
            do {
                let userModels = try JSONDecoder().decode(Users.self, from: data)
                self.users.value = userModels.compactMap({ UserTableViewCellModel(id: $0.id, username: $0.username, address: $0.address)
                })

            } catch {
                print("NOT WORKING")
            }
            
        }.resume()
    }
}

//MARK: Properties to be shown

struct UserTableViewCellModel {
    let id: Int
    let username: String
    let address: Address
}

