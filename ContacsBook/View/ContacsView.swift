//
//  ContacsView.swift
//  ContacsBook
//
//  Created by Лаборатория on 03.04.2023.
//

import UIKit

class ContactsView: UIView {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .absolute(48))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(8)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
            return section
        }
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    private lazy var newContactButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Новый контакт", for: .normal)
        return btn
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newContactButton, collectionView])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()


    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ContactsView {

    func setViews() {
        backgroundColor = .white
        collectionView.backgroundColor = .clear
//        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseID)
    }

    func setConstraints() {
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stack.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            stack.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
        ])
    }

}
