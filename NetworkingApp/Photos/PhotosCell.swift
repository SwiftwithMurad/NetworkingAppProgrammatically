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
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
        configConstraints()
        configImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        selectionStyle = .none
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
            photoImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            photoLabel.leadingAnchor.constraint(equalTo: photoImage.leadingAnchor, constant: 16),
            photoLabel.bottomAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: -8),
        ])
    }
    
    func configImage() {
        let url = URL(string: "https://picsum.photos/200/300?grayscale")
        let processor = DownsamplingImageProcessor(size: photoImage.bounds.size)
        photoImage.kf.setImage(with: url, placeholder: nil, options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage]) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func configCell(photo: Photos) {
        photoLabel.text = photo.title ?? ""
    }
}

