//
//  ChatListViewController.swift
//  homework
//
//  Created by Павел Терешонок on 22.11.2023.
//

import UIKit

final class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let users = ["Павел Терешонок", "Александр Стос", "Дмитрий Арбузов", "Владимир Путин", "Рик Санчес", "Алина Терешонок"]
    private let tableView = UITableView()
    private let bigButton = UIButton()
    private let bottomView = UIView()
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        bigButton.setTitle("Новый чат", for: .normal)
        bigButton.backgroundColor = .systemBlue
        bottomView.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        view.addSubview(bigButton)
        view.addSubview(bottomView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bigButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bigButton.topAnchor, constant: 0),
            bigButton.heightAnchor.constraint(equalToConstant: 48),
            bigButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bigButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bigButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            bottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])

    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! TableViewCell
        
        cell.username.text = users[indexPath.row]
        cell.imageViewAvatar.image = UIImage(named: users[indexPath.row])
        cell.timeOfLastMessage.text = "16:54"
        cell.lastMessage.text = "Привет, как у тебя дела? Что у тебя с кошкой, она еще жива?"
        
        
        return cell
        
    }
    
}



