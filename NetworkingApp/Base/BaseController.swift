//
//  BaseController.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configConstraints()
        configViewModel()
    }
    
    func configUI() {}
    func configConstraints() {}
    func configViewModel() {}
}
