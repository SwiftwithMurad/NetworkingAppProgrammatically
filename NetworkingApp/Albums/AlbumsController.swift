//
//  AlbumsController.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class AlbumsController: BaseController {
    let viewModel = AlbumsViewModel()
    
    private let albumsTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configUI() {
        title = "Albums"
        albumsTable.delegate = self
        albumsTable.dataSource = self
        albumsTable.register(PostCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(albumsTable)
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            albumsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            albumsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            albumsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            albumsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    override func configViewModel() {
        viewModel.getAlbum {
            self.albumsTable.reloadData()
        }
    }
}

extension AlbumsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PostCell
        cell.configCell(title: "", body: viewModel.album[indexPath.row].title ?? "", email: "")
        return cell
    }
}
