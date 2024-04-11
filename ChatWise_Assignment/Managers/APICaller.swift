//
//  APICaller.swift
//  ChatWise_Assignment
//
//  Created by Karan Verma on 11/04/24.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
}

/// Using Alamofire

func performRequest(completion: @escaping (Result<APIResponse, Error>) -> Void) {
guard let url = URL(string: "https://dummyjson.com/products") else {
    // when url is invalid
    completion(.failure(NetworkError.invalidURL))
    return
}
AF.request(url).responseData { response in
    switch response.result {
    case .success(let data):
        do {
            // Decoding the data
            let results = try JSONDecoder().decode(APIResponse.self, from: data)
            completion(.success(results))
        } catch {
            // if data fails to decode
            completion(.failure(error))
        }
    case .failure(let error):
        completion(.failure(error))
    }
}
}


/// Using Native Networking
///
//    func performRequest(completion: @escaping (Result<APIResponse, Error>) -> Void){
//        guard let url = URL( string: "https://dummyjson.com/products") else {return}
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
//            if let error = error{
//                print("Error: \(error.localizedDescription)kljlkj")
//                return
//            }
//
//            guard let data = data else {
//                print("No data recieved")
//                return
//            }
//
//            do{
//                let results = try JSONDecoder().decode(APIResponse.self, from: data)
//                print(results.products[0])
//                completion(.success(results))
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//
//    }
