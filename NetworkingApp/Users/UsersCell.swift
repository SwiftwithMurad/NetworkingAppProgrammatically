//
//  UsersCell.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class UsersCell: UITableViewCell {
    private let labelView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        separatorInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        addSubview(labelView)
        [nameLabel, emailLabel].forEach { labelView.addSubview($0) }
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            nameLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: labelView.topAnchor, constant: 0),
            
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            emailLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor, constant: -8),
        ])
    }
    
    func configCell(name: String, email: String) {
        nameLabel.text = name
        emailLabel.text = email
    }
}
