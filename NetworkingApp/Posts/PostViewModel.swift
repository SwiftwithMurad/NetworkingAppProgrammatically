//
//  PostViewModel.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import Foundation

class PostViewModel {
    var post = [Post]()
    
    func getPost(reloadTable: (() -> Void)?) {
        guard let url = URL(string: "\(APIFile.baseURL)") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else if let data {
                do {
                    self.post = try JSONDecoder().decode([Post].self, from: data)
                    print(self.post)
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
