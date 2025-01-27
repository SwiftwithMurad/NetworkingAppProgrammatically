//
//  UserDetailController.swift
//  NetworkingApp
//
//  Created by Mac on 27.01.25.
//

import UIKit

class UserDetailController: BaseController {
    let viewModel = UserDetailViewModel()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configUI() {
        [nameLabel, emailLabel, phoneLabel, companyLabel, addressLabel].forEach { view.addSubview($0) }
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            phoneLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            companyLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8),
            companyLabel.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 8),
            addressLabel.leadingAnchor.constraint(equalTo: companyLabel.leadingAnchor)
        ])
    }
    
    func configController(user: Users) {
        nameLabel.text = "Username: \(user.name ?? "")"
        emailLabel.text = "Email: \(user.email ?? "")"
        phoneLabel.text = "Phone: \(user.phone ?? "")"
        companyLabel.text = "Company: \(user.company?.name ?? "")"
        addressLabel.text = "Address: \(user.address?.city ?? "")"
    }
}
