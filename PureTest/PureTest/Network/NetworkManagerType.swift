//
//  NetworkManagerType.swift
//  PureTest
//
//  Created by 박형석 on 2022/02/11.
//

import Foundation

protocol NetworkManagerType {
    func request(with query: String, completion: @escaping (Result<[Friend], Error>) -> Void)
}
