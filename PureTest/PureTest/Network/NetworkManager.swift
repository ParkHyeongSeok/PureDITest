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
    
    func request(with query: String, completion: @escaping (Result<[String], Error>) -> Void) {
        completion(.success([
            "형석",
            "선아"
        ]))
    }
    
}
