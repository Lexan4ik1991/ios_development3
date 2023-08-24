//
//  MyFriendCell.swift
//  HWNetwork
//
//  Created by Алексей on 21.08.2023.
//
import UIKit

final class MyFriendCell: UITableViewCell {
    private var friendImageView = UIImageView(image:
        UIImage(systemName: "person"))

    private var title :UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupViews() {
        contentView.addSubview(friendImageView)
        contentView.addSubview(title)
        setupConstraints()
    }
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            friendImageView.bottomAnchor.constraint(equalTo:contentView.bottomAnchor,constant :-101),
            friendImageView.widthAnchor.constraint(equalTo: friendImageView.heightAnchor),
            
            friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
            title.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
        
            
        ])
    }
}
