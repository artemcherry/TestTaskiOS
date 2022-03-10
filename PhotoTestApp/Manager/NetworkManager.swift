//
//  NetworkManager.swift
//  PhotoTestApp
//
//  Created by Артем Вишняков on 10.03.2022.
//

import Foundation

class NetworkManager {
    
    
    
    static func getData(urlString: String, completion: @escaping ([PhotoModel]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil,
                  let data = data
            else { return }
            guard let parcedData = try? JSONDecoder().decode([PhotoModel].self, from: data) else { return }
            completion(parcedData, nil)
        }
        task.resume()
    }
}
