//
//  CommentsController.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class CommentsController: BaseController {
    let viewModel = CommentsViewModel()
    
    private let commentsTable: UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configUI() {
        title = "Comments"
        commentsTable.register(PostCell.self, forCellReuseIdentifier: "cell")
        commentsTable.delegate = self
        commentsTable.dataSource = self
        view.addSubview(commentsTable)
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            commentsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            commentsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            commentsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            commentsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    override func configViewModel() {
        viewModel.getComment {
            self.commentsTable.reloadData()
        }
    }
}

extension CommentsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PostCell
        cell.configCell(title: viewModel.comment[indexPath.row].name ?? "", body: viewModel.comment[indexPath.row].body ?? "", email: viewModel.comment[indexPath.row].email ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
