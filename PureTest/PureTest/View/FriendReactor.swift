//
//  FriendReactor.swift
//  PureTest
//
//  Created by 박형석 on 2022/03/08.
//

import Foundation
import ReactorKit
import RxSwift

final class FriendReactor: Reactor {

    enum Action {
        case inputQuery(String)
    }

    enum Mutate {
        case setLoading(Bool)
        case setFriends([Friend])
        case setError(NetworkError)
    }

    struct State {
        var isLoading: Bool = false
        var friendList: [Friend] = []
        var onError: RevisionedError = RevisionedError(revision: 0, error: .unknown)
    }

    struct RevisionedError {
        let revision: UInt
        let error: NetworkError

        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.revision == rhs.revision && lhs.error == rhs.error
        }
    }

    let initialState: State
    let friendService: FriendServiceProtocol

    init(
        friendService: FriendServiceProtocol
    ) {
        self.initialState = State()
        self.friendService = friendService
    }

    func mutate(action: Action) -> Observable<Mutate> {
        switch action {
        case let .inputQuery(query):
            let friendsList = self.friendService.fetchFriends(with: query)
                .map { Mutate.setFriends($0) }
                .catchAndReturn(Mutate.setError(.fetch))

            return Observable<Mutate>.concat([
                .just(.setLoading(true)),
                friendsList,
                .just(.setLoading(false))
            ])
        }
    }

    func reduce(state: State, mutation: Mutate) -> State {
        var newState = state
        switch mutation {
        case let .setFriends(friendList):
            newState.friendList = friendList
        case let .setLoading(isLoading):
            newState.isLoading = isLoading
        case let .setError(error):
            newState.onError = RevisionedError(
                revision: newState.onError.revision + 1,
                error: error
            )
        }
        return newState
    }
}
