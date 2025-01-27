//
//  AlbumsViewModel.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import Foundation

class AlbumsViewModel {
    var album = [Albums]()
    
    func getAlbum(reloadTable: (() -> Void)?) {
        guard let url = URL(string: APIFile.albumURL) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else if let data {
                do {
                    self.album = try JSONDecoder().decode([Albums].self, from: data)
                    print(self.album)
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
