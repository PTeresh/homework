//
//  ChatListViewController.swift
//  homework
//
//  Created by Павел Терешонок on 22.11.2023.
//

import UIKit

class ChatListViewController: UIViewController {

    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



