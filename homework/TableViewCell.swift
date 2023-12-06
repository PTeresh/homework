
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

        imageViewAvatar.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.top.equalTo(contentView).offset(8)
            make.bottom.equalTo(contentView).offset(-8)
            make.size.equalTo(CGSize(width: imageViewSize, height: imageViewSize))
        }
        username.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.leading.equalTo(imageViewAvatar.snp.trailing).offset(16)
            make.trailing.equalTo(imageViewIndicator.snp.leading).offset(-8)
        }
        imageViewIndicator.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.trailing.equalTo(timeOfLastMessage.snp.leading).offset(-8)
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        timeOfLastMessage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.trailing.equalTo(contentView).offset(-16)
        }
        lastMessage.snp.makeConstraints { make in
            make.leading.equalTo(imageViewAvatar.snp.trailing).offset(16)
            make.top.equalTo(username.snp.bottom).offset(8)
            make.trailing.equalTo(contentView).offset(-16)
        }    
    }
}
