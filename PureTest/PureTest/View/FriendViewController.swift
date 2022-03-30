//
//  FriendViewController.swift
//  PureTest
//
//  Created by 박형석 on 2022/02/11.
//

import UIKit
import Pure
import ReactorKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    var disposeBag: DisposeBag = DisposeBag()
}

final class FriendViewController: BaseViewController, FactoryModule, View {

    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    private lazy var friendCollectionView: UICollectionView = {
        let cv = UICollectionView(
            frame: .zero,
            collectionViewLayout: self.flowLayout
        )
        cv.register(
            FriendCell.self,
            forCellWithReuseIdentifier: String(describing: FriendCell.self)
        )
        return cv
    }()

    private let activityIndicator = UIActivityIndicatorView()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeConstraints()
    }
    
    func bind(reactor: FriendReactor) {

        reactor.state
            .map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: self.activityIndicator.rx.isAnimating)
            .disposed(by: self.disposeBag)

        reactor.state
            .map { $0.friendList }
            .distinctUntilChanged()
            .bind(to: self.friendCollectionView.rx.items(
                cellIdentifier: String(describing: FriendCell.self),
                cellType: FriendCell.self)
            ) { row, item, cell in
                
            }
            .disposed(by: self.disposeBag)


    }
    
    func makeConstraints() {
        self.view.addSubview(friendCollectionView)
        self.friendCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.friendCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.friendCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.friendCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.friendCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
}

