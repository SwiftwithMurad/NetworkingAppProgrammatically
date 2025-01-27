//
//  PhotosViewModel.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import Foundation

class PhotosViewModel {
    var photo = [Photos]()
    
    func getPhoto(reloadTable: (() -> Void)?) {
        guard let url = URL(string: APIFile.photoURL) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else if let data {
                do {
                    self.photo = try JSONDecoder().decode([Photos].self, from: data)
                    print(self.photo)
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
