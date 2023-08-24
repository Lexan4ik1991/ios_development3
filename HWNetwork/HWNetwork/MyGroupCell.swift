//
//  MyGroupCell.swift
//  HWNetwork
//
//  Created by Алексей on 21.08.2023.
//
import UIKit

final class MyGroupCell: UITableViewCell {
    
    private var groupImageView = UIImageView(image:
        UIImage(systemName: "person"))

    private var title :UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        return label
    }()
    
    private var subtitle :UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .gray
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
        contentView.addSubview(groupImageView)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        setupConstraints()
    }
    private func setupConstraints() {
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            groupImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            groupImageView.heightAnchor.constraint(equalTo: 50),
            groupImageView.widthAnchor.constraint(equalTo: groupImageView.heightAnchor),
            
            
            title.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        
            subtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            
            subtitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10)
            
        ])
    }
}