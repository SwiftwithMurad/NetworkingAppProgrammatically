//
//  PostController.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class PostController: BaseController {
    let viewModel = PostViewModel()
    
    private let postTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configUI() {
        title = "Post items"
        postTable.register(PostCell.self, forCellReuseIdentifier: "cell")
        postTable.delegate = self
        postTable.dataSource = self
        view.addSubview(postTable)
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            postTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            postTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            postTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            postTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
        
    }
    
    override func configViewModel() {
        viewModel.getPost {
            self.postTable.reloadData()
        }
    }
}

extension PostController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PostCell
        cell.configCell(title: viewModel.post[indexPath.row].title ?? "", body: viewModel.post[indexPath.row].body ?? "", email: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = CommentsController()
        controller.viewModel.postID = viewModel.post[indexPath.row].id
        navigationController?.show(controller, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
