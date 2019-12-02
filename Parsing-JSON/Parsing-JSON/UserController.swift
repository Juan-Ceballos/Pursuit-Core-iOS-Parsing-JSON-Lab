//
//  UserController.swift
//  Parsing-JSON
//
//  Created by Juan Ceballos on 12/1/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class UserController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    var users = [User]()    {
        didSet  {
            userTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        users = UserData.getUserData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedUserController = segue.destination as? DetailedUserController, let indexPath = userTableView.indexPathForSelectedRow else    {
            fatalError("segue")
        }
        
        let userData = users[indexPath.row]
        detailedUserController.users = userData
    }
}

extension UserController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = userTableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let user = users[indexPath.row]
        
        userCell.textLabel?.text = "\(user.name.title). \(user.name.first) \(user.name.last)"
        
        userCell.detailTextLabel?.text = "\(user.email)"
        
        return userCell
    }
}
