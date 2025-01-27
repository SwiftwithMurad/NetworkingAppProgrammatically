//
//  PhotosController.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class PhotosController: BaseController {
    let viewModel = PhotosViewModel()
    
    private let photosTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configUI() {
        view.addSubview(photosTable)
        photosTable.delegate = self
        photosTable.dataSource = self
        photosTable.register(PhotosCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            photosTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            photosTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            photosTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            photosTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])

    }
    
    override func configViewModel() {
        viewModel.getPhoto {
            self.photosTable.reloadData()
        }
    }
}

extension PhotosController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PhotosCell
        cell.configCell(photo: viewModel.photo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PhotoDetailController()
        controller.title = viewModel.photo[indexPath.row].title
        navigationController?.show(controller, sender: nil)
    }
}
