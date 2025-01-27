//
//  UsersViewModel.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import Foundation

class UsersViewModel {
    var users = [Users]()
    
    func getUser(reloadTable: (() -> Void)?) {
        guard let url = URL(string: APIFile.userURL) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else if let data {
                do {
                    self.users = try JSONDecoder().decode([Users].self, from: data)
                    print(self.users)
                    DispatchQueue.main.async {
                        reloadTable?()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
