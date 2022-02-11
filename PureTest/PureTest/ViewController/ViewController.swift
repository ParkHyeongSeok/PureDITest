//
//  ViewController.swift
//  PureTest
//
//  Created by 박형석 on 2022/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    private let friendsTableview: UITableView = {
       let tb = UITableView()
        tb.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        return tb
    }()
    
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bind()
        self.makeConstraints()
        self.friendsTableview.delegate = self
        self.friendsTableview.dataSource = self
    }
    
    func bind() {
        viewModel.updateFriendsList = { [weak self] in
            self?.friendsTableview.reloadData()
        }
    }
    
    func makeConstraints() {
        self.view.addSubview(friendsTableview)
        self.friendsTableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.friendsTableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.friendsTableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.friendsTableview.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.friendsTableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        let data = viewModel.friends[indexPath.row]
        cell.rendering(name: data)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

