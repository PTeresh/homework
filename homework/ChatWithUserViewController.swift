
import UIKit

final class ChatWithUserViewController: UIViewController {
    
    private let nameOfUser = UILabel()
    var selectedName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nameOfUser.text = selectedName
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
