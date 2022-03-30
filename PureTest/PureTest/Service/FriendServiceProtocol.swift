//
//  FriendServiceProtocol.swift
//  PureTest
//
//  Created by 박형석 on 2022/03/30.
//

import Foundation
import RxSwift

protocol FriendServiceProtocol {
    func fetchFriends(with query: String) -> Observable<[Friend]>
}
