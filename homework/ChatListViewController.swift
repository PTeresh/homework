//
//  ChatListViewController.swift
//  homework
//
//  Created by Павел Терешонок on 22.11.2023.
//

import UIKit
import SnapKit

final class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let users = ["Павел Терешонок", "Александр Стос", "Дмитрий Арбузов", "Владимир Путин", "Рик Санчес", "Алина Терешонок"]
    private let favoriteUsers = ["Александр Стос", "Алина Терешонок"]
    private let workUsers = ["Владимир Путин","Рик Санчес"]
    private let sectionNames = ["избранные", "работа", "все чаты"]
    
    private let tableView = UITableView()
    private let bigButton = UIButton()
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.selectionFollowsFocus = false
        
        let action = UIAction(handler: {_ in
            let newChat = NewChatViewController()
            self.present(newChat, animated: true, completion: nil)
        })
        let printAction = UIAction(handler: {_ in
            print("Hello")
        })
        bigButton.addAction(action, for: .touchUpOutside)
        bigButton.addAction(printAction, for: .touchUpInside)
        
        bigButton.setTitle("Новый чат", for: .normal)
        bigButton.backgroundColor = .systemBlue
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        view.addSubview(bigButton)
        
        tableView.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(view).offset(0)
            make.bottom.equalTo(bigButton.snp.top).offset(0)
        }
        bigButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalTo(view).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return favoriteUsers.count
        case 1: return workUsers.count
        case 2: return users.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! TableViewCell
        
        switch indexPath.section{
        case 0: cell.username.text = favoriteUsers[indexPath.row]
                cell.imageViewAvatar.image = UIImage(named: favoriteUsers[indexPath.row])
        case 1: cell.username.text = workUsers[indexPath.row]
                cell.imageViewAvatar.image = UIImage(named: workUsers[indexPath.row])
        case 2: cell.username.text = users[indexPath.row]
                cell.imageViewAvatar.image = UIImage(named: users[indexPath.row])
        default:
            break
        }
        
        cell.timeOfLastMessage.text = "16:54"
        cell.lastMessage.text = "Привет, как у тебя дела? Что у тебя с кошкой, она еще жива? Хочу сильно есть!"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatWithUser = ChatWithUserViewController()
        chatWithUser.selectedName = users[indexPath.row]
        navigationController?.pushViewController(chatWithUser, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
}



