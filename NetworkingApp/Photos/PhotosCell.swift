//
//  PhotosCell.swift
//  NetworkingApp
//
//  Created by Mac on 27.01.25.
//

import UIKit
import Kingfisher

class PhotosCell: UITableViewCell {
    private let photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let photoLabel: UILabel = {
        let label = UILabel()
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
        addSubview(photoImage)
        photoImage.addSubview(photoLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            photoImage.widthAnchor.constraint(equalToConstant: 300),
            photoImage.heightAnchor.constraint(equalToConstant: 300),
            photoImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            photoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            photoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            photoImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            photoLabel.leadingAnchor.constraint(equalTo: photoImage.leadingAnchor, constant: 16),
            photoLabel.bottomAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: -8),
        ])
    }
    
    func configCell(photo: Photos) {
        photoImage.image = UIImage(named: photo.url ?? "")
        photoLabel.text = photo.title ?? ""
    }
}
