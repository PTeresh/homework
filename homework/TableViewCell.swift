
import UIKit

final class TableViewCell: UITableViewCell {
    let username = UILabel()
    let imageViewAvatar = UIImageView()
    private let imageViewSize: CGFloat = 72
    let lastMessage = UILabel()
    let timeOfLastMessage = UILabel()
    private let imageViewIndicator = UIImageView(image: UIImage(systemName: "checkmark.circle"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        imageViewAvatar.contentMode = .scaleAspectFill
        imageViewAvatar.layer.cornerRadius = imageViewSize / 2
        imageViewAvatar.clipsToBounds = true
        username.font = .systemFont(ofSize: 15, weight: .bold)
        lastMessage.numberOfLines = 2
        lastMessage.textColor = .gray
    }
    
    private func layout() {
        contentView.addSubview(username)
        contentView.addSubview(imageViewAvatar)
        contentView.addSubview(lastMessage)
        contentView.addSubview(timeOfLastMessage)
        contentView.addSubview(imageViewIndicator)
        username.translatesAutoresizingMaskIntoConstraints = false
        imageViewAvatar.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        timeOfLastMessage.translatesAutoresizingMaskIntoConstraints = false
        imageViewIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageViewAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageViewAvatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            imageViewAvatar.heightAnchor.constraint(equalToConstant: imageViewSize),
            imageViewAvatar.widthAnchor.constraint(equalToConstant: imageViewSize),
            username.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            username.leadingAnchor.constraint(equalTo: imageViewAvatar.trailingAnchor, constant: 16),
            username.trailingAnchor.constraint(equalTo: imageViewIndicator.leadingAnchor, constant: 8),
            imageViewIndicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageViewIndicator.trailingAnchor.constraint(equalTo:timeOfLastMessage.leadingAnchor , constant: -8),
            imageViewIndicator.heightAnchor.constraint(equalToConstant: 16),
            imageViewIndicator.widthAnchor.constraint(equalToConstant: 16),
            timeOfLastMessage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            timeOfLastMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            lastMessage.leadingAnchor.constraint(equalTo: imageViewAvatar.trailingAnchor, constant: 16),
            lastMessage.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 8),
            lastMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            
        ])
        

        
    }
}
