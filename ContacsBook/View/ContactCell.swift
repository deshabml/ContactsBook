//
//  ContactCell.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    static let reuseID = "ContactCell"

    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Имя Фамилия"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
        setLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactCell {

    func setLayer() {
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 1.5
        layer.shadowOpacity = 0.4
    }

    func setConstraints() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
