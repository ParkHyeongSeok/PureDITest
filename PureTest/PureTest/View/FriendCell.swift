//
//  FriendCell.swift
//  PureTest
//
//  Created by 박형석 on 2022/03/08.
//

import UIKit

final class FriendCell: UICollectionViewCell {

    private let friendName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private let friendAge: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.makeConstraints()
    }

    private func makeConstraints() {
        self.contentView.addSubview(self.friendName)
        self.friendName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.friendName.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.friendName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        ])

        self.contentView.addSubview(self.friendAge)
        self.friendAge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.friendAge.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.friendAge.trailingAnchor.constraint(equalToSystemSpacingAfter: self.contentView.trailingAnchor, multiplier: 20)
        ])
    }
}
