//
//  PhotoDetailController.swift
//  NetworkingApp
//
//  Created by Mac on 27.01.25.
//

import UIKit
import Kingfisher

class PhotoDetailController: BaseController {
    private let photoDetailImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configImage()
    }
    
    override func configUI() {
        view.addSubview(photoDetailImage)
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            photoDetailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            photoDetailImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            photoDetailImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            photoDetailImage.heightAnchor.constraint(equalToConstant: 600),
        ])
    }
    
    func configImage() {
        let url = URL(string: "https://picsum.photos/200/300?grayscale")
        let processor = DownsamplingImageProcessor(size: photoDetailImage.bounds.size)
        photoDetailImage.kf.setImage(with: url, placeholder: nil, options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage]) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
