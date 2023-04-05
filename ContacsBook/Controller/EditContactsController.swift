//
//  EditContactsController.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

import UIKit

class EditContactsController: UIViewController {

    private lazy var agePickerData: [Int] = Array(0...150)

    private lazy var genderPickerData: Bool = true

    private lazy var categoryData: [String] = [ContactCategory.classmates.rawValue, ContactCategory.coworkers.rawValue, ContactCategory.family.rawValue, ContactCategory.friends.rawValue]


    let mainView = EditContactsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetting()
        setView()
        mainView.agePicker.selectRow(30, inComponent: 0, animated: true)
    }

}

extension EditContactsController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == mainView.agePicker {
            return agePickerData.count
        } else if pickerView == mainView.genderPicker {
            return 2
        } else {
            return categoryData.count
        }
    }

}

extension EditContactsController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == mainView.agePicker {
            return "\(agePickerData[row])"
        } else if pickerView == mainView.genderPicker {
            if row == 0 {
                genderPickerData = true
                return "Мужской"
            } else {
                genderPickerData = false
                return "Женский"
            }
        } else {
            return categoryData[row]
        }
    }
    
}

extension EditContactsController {

    private func navigationBarSetting() {
//        if let _ = habit {
            title = "Править"
//        } else {
//            title = "Cоздать"
//        }
        let novigationBarColor = UINavigationBarAppearance()
        novigationBarColor.titleTextAttributes = [.foregroundColor: UIColor.black]
        novigationBarColor.backgroundColor = .systemGray5
        navigationItem.scrollEdgeAppearance = novigationBarColor
        let buttenSave = UIBarButtonItem(title: "Cохранить", style: .done, target: self, action: #selector(buttonAction))
        let buttenBack = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(backButtonAction))
        navigationItem.rightBarButtonItem = buttenSave
        navigationItem.leftBarButtonItem = buttenBack
        navigationItem.rightBarButtonItem?.tintColor = .systemBlue
        navigationItem.leftBarButtonItem?.tintColor = .systemBlue
    }

    func setView() {
        mainView.agePicker.dataSource = self
        mainView.agePicker.delegate = self
        mainView.genderPicker.dataSource = self
        mainView.genderPicker.delegate = self
        mainView.categoryPicker.dataSource = self
        mainView.categoryPicker.delegate = self
//        mainView.setView(doneButtonAction: {
//            self.exitButtonAction()
//        }, cancelButtonAction: {
//            self.cancelButtonAcyion()
//        })
        view = mainView
        view.backgroundColor = .systemGray5
    }

    @objc func buttonAction() {
        let data = mainView.getData()
        guard let nameText = data.nameTextField, let emailText = data.emailTextField, let phone = Int(data.phoneTextField ?? "") else { return }
        let newContact: Contact = Contact(name: nameText,
                                          email: emailText,
                                          age: 34,
                                          phone: phone,
                                          gender: true,
                                          category: .family)
        DataService.shared.saveContact(newContact) {
            print("ap op")
        }
        print(mainView.agePicker.selectedRow(inComponent: 0))
        navigationController?.popViewController(animated: true)
    }

    @objc func backButtonAction() {
       DataService.shared.deleteContact(contact: Contact(name: "Вован", email: "Vladi@mt.ru", age: 34, phone: 88888888888, gender: true, category: .family))
        navigationController?.popViewController(animated: true)
    }

//    func exitButtonAction() {
//        dismiss(animated: true, completion: nil)
//    }
//
//    func cancelButtonAcyion() {
//        dismiss(animated: true, completion: nil)
//    }

}
