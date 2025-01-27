//
//  CommentsViewModel.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import Foundation
import Alamofire

class CommentsViewModel {
    var comment = [Comments]()
    var postID: Int?
    
    func getComment(reloadTable: (() -> Void)?) {
        guard let url = URL(string: "\(APIFile.baseURL)/\(postID ?? 0)/comments") else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else if let data {
                do {
                    self.comment = try JSONDecoder().decode([Comments].self, from: data)
                    print(self.comment)
                    DispatchQueue.main.async {
                        reloadTable?()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getCommentWithAlamofire() {
        guard let url = URL(string: "\(APIFile.baseURL)/\(postID ?? 0)/comments") else { return }
        AF.request(url).responseDecodable(of: [Comments].self) { response in
            switch response.result {
            case .success(let items):
                print(items)
                self.comment = items
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
