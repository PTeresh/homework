
import UIKit

final class ChatWithUserViewController: UIViewController {
    
    private let nameOfUser = UILabel()
    var selectedName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let nameOnScreen = selectedName {
            nameOfUser.text = selectedName
            title = "Чат с \(nameOnScreen)"
        } else {
            nameOfUser.text = "Чат"
            title = "Чат"
        }
        
        layout()
    }
    
    private func layout() {
        view.addSubview(nameOfUser)
        nameOfUser.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameOfUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameOfUser.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
