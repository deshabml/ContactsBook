//
//  ViewController.swift
//  ContacsBook
//
//  Created by Лаборатория on 03.04.2023.
//

import UIKit

class ContactsController: UIViewController {

    private lazy var mainView: UIView = {
        let mainView = ContactsView()
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.setView {
            self.presentEditContacts()
        }
        return mainView
    }()

    private lazy var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setNavBar()
        getContacts()
    }

}

extension ContactsController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactCell.reuseID, for: indexPath) as! ContactCell
        cell.nameLabel.text = contacts[indexPath.item].name
        return cell
    }
    
}

extension ContactsController {

    func presentEditContacts() {
        let ecc = EditContactsController()
        present(ecc, animated: true)
    }

    func setNavBar() {
        navigationItem.title = DataService.shared.userName ?? "Введите имя пользователя"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "pencil.and.outline")!,
            style: .plain,
            target: self,
            action: #selector(showSetNameAlert))
    }

    func getContacts() {
        self.contacts = DataService.shared.getContacts()
    }


    @objc func showSetNameAlert() {
        let alert = UIAlertController(title: "Задайте себе имя", message: nil, preferredStyle: .alert)
        alert.addTextField { tf in
            tf.placeholder = "Ваше имя..."
        }
        let okAction = UIAlertAction(title: "Готово!", style: .default) { _ in
            guard let name = alert.textFields![0].text else { return }
            DataService.shared.saveUserName(name) {
                guard let userName = DataService.shared.userName else { return }
                self.navigationItem.title = userName
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }

}

