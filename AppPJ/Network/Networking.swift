//
//  Networking.swift
//  AppPJ
//
//  Created by Pawel Janka on 29/04/2020.
//  Copyright © 2020 Pawel Janka. All rights reserved.
//

import Foundation

protocol NetworkProviding {
    func getItems(forLimit: Int, completion: @escaping (Result<[Item], Error>) -> Void)
}

final class Networking: NetworkProviding  {

    private let baseUrl = "https://jsonplaceholder.typicode.com/photos?_limit=20"
    private let decoder = JSONDecoder()

    func getItems(forLimit: Int, completion: @escaping (Result<[Item], Error>) -> Void) {
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard
                let data = data,
                let _ = response,
                error == nil
            else {
                guard let error = error else { return }
                completion(.failure(error))
                return
            }

            do {
                let itemsList = try JSONDecoder().decode([Item].self, from: data)
                completion(.success(itemsList))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
