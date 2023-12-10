//
//  ChatListViewController.swift
//  homework
//
//  Created by Павел Терешонок on 22.11.2023.
//

import UIKit
import SnapKit

final class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allTitles: [String] {
     var titles = Category.allCases.map { $0.title }
     titles.append("Все")
     return titles
    }
    
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
        allTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return User.filterUsers(by: .favorite).count
        case 1: return User.filterUsers(by: .work).count
        case 2: return User.filterUsers(by: .player).count
        case 3: return User.users.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! TableViewCell
        
        let user = getUser(by: indexPath)
        
        cell.username.text = user.name
        cell.imageViewAvatar.image = UIImage(named: user.name)
        
        cell.timeOfLastMessage.text = "16:54"
        cell.lastMessage.text = "Привет, как у тебя дела? Что у тебя с кошкой, она еще жива? Хочу сильно есть!"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = getUser(by: indexPath)
        
        let chatWithUser = ChatWithUserViewController()
        chatWithUser.selectedName = user.name
        navigationController?.pushViewController(chatWithUser, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        allTitles[section]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let user = getUser(by: indexPath)
			var paths = [indexPath]
			if let category = user.category {
				if indexPath.section == 3 {
					// добавить indexPath в своей категории
					if let rowInAllSection = User.filterUsers(by: category).firstIndex(of: user) {
						let additionalIndexPath = IndexPath(row: rowInAllSection, section: category.categoryNumber)
						paths.append(additionalIndexPath)
					}
				} else {
					// добавить indexPath во "Всех"
					if let rowInAllSection = User.users.firstIndex(of: user) {
						let additionalIndexPath = IndexPath(row: rowInAllSection, section: 3)
						paths.append(additionalIndexPath)
					}
				}
			} else {
				// [indexPath]
			}
			User.users.removeAll(where: { $0 == user})
			tableView.deleteRows(at: paths, with: .fade)
        }
    }
    
    private func getUser(by indexPath: IndexPath) -> User {
        let user: User
        
        switch indexPath.section{
        case 0: user = User.filterUsers(by: .favorite)[indexPath.row]
        case 1: user = User.filterUsers(by: .work)[indexPath.row]
        case 2: user = User.filterUsers(by: .player)[indexPath.row]
        case 3: user = User.users[indexPath.row]
        default: user = User.users[indexPath.row]
        }
        
        return user
    }
}



