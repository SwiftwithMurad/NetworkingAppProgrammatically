//
//  UserDetailViewModel.swift
//  NetworkingApp
//
//  Created by Mac on 27.01.25.
//

import Foundation

class UserDetailViewModel {
    var user = [Users]()
    
    func getUserDetail() {
        guard let url = URL(string: APIFile.userURL) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else if let data {
                do {
                    self.user = try JSONDecoder().decode([Users].self, from: data)
//                    DispatchQueue.main.async {
//                        reloadTable?()
//                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
