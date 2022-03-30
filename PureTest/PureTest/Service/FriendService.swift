//
//  FriendService.swift
//  PureTest
//
//  Created by 박형석 on 2022/03/08.
//

import Foundation
import RxSwift

final class FriendService: FriendServiceProtocol {

    private let networkManager: NetworkManagerType

    init(
        networkManager: NetworkManagerType
    ) {
        self.networkManager = networkManager
    }

    func fetchFriends(with query: String) -> Observable<[Friend]> {
        return Observable.create { observer in
            self.networkManager.request(with: query) { result in
                switch result {
                case let .success(friends):
                    observer.onNext(friends)
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
