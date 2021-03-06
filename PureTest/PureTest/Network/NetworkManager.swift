//
//  NetworkManager.swift
//  PureTest
//
//  Created by 박형석 on 2022/02/11.
//

import Foundation

final class NetworkManager: NetworkManagerType {
    
    private let urlSession: URLSession
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func request(with query: String, completion: @escaping (Result<[Friend], Error>) -> Void) {
        completion(.success([
            Friend(name: "형석", age: 35),
            Friend(name: "선아", age: 34)
        ]))
    }
    
}
