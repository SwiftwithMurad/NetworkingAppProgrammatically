//
//  UsersController.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class UsersController: BaseController {
    let viewModel = UsersViewModel()
    
    private let usersTable: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configUI() {
        title = "Users"
        usersTable.delegate = self
        usersTable.dataSource = self
        usersTable.register(UsersCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(usersTable)
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            usersTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            usersTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            usersTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            usersTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    override func configViewModel() {
        viewModel.getUser {
            self.usersTable.reloadData()
        }
    }
}

extension UsersController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UsersCell
        cell.configCell(name: viewModel.users[indexPath.row].name ?? "", email: viewModel.users[indexPath.row].email ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UserDetailController()
        controller.title = viewModel.users[indexPath.row].name
        controller.configController(user: viewModel.users[indexPath.row])
        navigationController?.show(controller, sender: nil)
     }
}
