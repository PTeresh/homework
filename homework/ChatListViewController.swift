//
//  ChatListViewController.swift
//  homework
//
//  Created by Павел Терешонок on 22.11.2023.
//

import UIKit

class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    let users = ["Павел Терешонок", "Александр Стос", "Дмитрий Арбузов", "Владимир Путин", "Рик Санчес", "Алина Терешонок"]
    var tableView = UITableView()
    var bigButton = UIButton()
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  //      tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        
        bigButton.setTitle("Новый чат", for: .normal)
        bigButton.backgroundColor = .systemBlue
        bigButton.frame = CGRect(x: 0, y: view.bounds.height - 100, width: view.bounds.width, height: 50)
        bigButton.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        
        view.addSubview(tableView)
        view.addSubview(bigButton)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! TableViewCell
        
//        cell.username.text = users[indexPath.row]
        
        
        return cell
        
    }
    
}



