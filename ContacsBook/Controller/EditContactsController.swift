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

    private var contactEdit: Contact!

    private lazy var isEdit: Bool = false

    private lazy var categoryData: [String] = [ContactCategory.classmates.rawValue, ContactCategory.coworkers.rawValue, ContactCategory.family.rawValue, ContactCategory.friends.rawValue]

    let mainView = EditContactsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetting()
        setView()
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
        title = isEdit ? "Изменение контакта" : "Контакт"
        let novigationBarColor = UINavigationBarAppearance()
        novigationBarColor.titleTextAttributes = [.foregroundColor: UIColor.black]
        novigationBarColor.backgroundColor = .systemGray5
        navigationItem.scrollEdgeAppearance = novigationBarColor
        let buttenSave = UIBarButtonItem(title: isEdit ? "Cохранить" : "Готово", style: .done, target: self, action: #selector(buttonAction))
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
        setupEdit()
        view = mainView
        view.backgroundColor = .systemGray5
    }

    @objc func buttonAction() {
        let data = mainView.getData()
        guard let nameText = data.nameTextField, let emailText = data.emailTextField, let phone = Int(data.phoneTextField ?? "") else { return }
        let age = agePickerData[mainView.agePicker.selectedRow(inComponent: 0)]
        print(age)
        let category: ContactCategory
        switch categoryData[mainView.categoryPicker.selectedRow(inComponent: 0)] {
            case ContactCategory.classmates.rawValue:
                category = .classmates
            case ContactCategory.coworkers.rawValue:
                category = .coworkers
            case ContactCategory.family.rawValue:
                category = .family
            case ContactCategory.friends.rawValue:
                category = .friends
            default:
                category = .friends
        }
        let newContact: Contact = Contact(name: nameText,
                                          email: emailText,
                                          age: age,
                                          phone: phone,
                                          gender: genderPickerData,
                                          category: category)
        if isEdit {
            DataService.shared.editContact(contactOld: contactEdit, contactNew: newContact)
        } else {
            DataService.shared.saveContact(newContact){}
        }

        navigationController?.popViewController(animated: true)
    }

    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }

    func setupEdit(contactEdit: Contact) {
        self.contactEdit = contactEdit
        isEdit = true
    }

    func setupEdit() {
        mainView.agePicker.selectRow(30, inComponent: 0, animated: true)
        if isEdit {
            mainView.setupEdit(name: contactEdit.name,
                               email: contactEdit.email,
                               phone: "\(contactEdit.phone)",
                               deleteActoins: {
                self.deleteContact()
            })
            mainView.agePicker.selectRow(contactEdit.age, inComponent: 0, animated: true)
            mainView.genderPicker.selectRow(contactEdit.gender ? 0 : 1, inComponent: 0, animated: true)
            let categoryIndex = categoryData.firstIndex { category in
                category == contactEdit.category.rawValue
            }
            guard let categoryIndex else { return }
            mainView.categoryPicker.selectRow(categoryIndex, inComponent: 0, animated: true)
        }
    }

    func deleteContact() {
        let avc = UIAlertController(title: "Удалить контакт", message: "Вы хотите удалить контакт \n \"" + contactEdit.name + "\"?", preferredStyle: .alert)
        avc.addAction(UIAlertAction(title: "Отмена", style: .cancel){ _ in
            avc.dismiss(animated: true)
        })
        avc.addAction(UIAlertAction(title: "Удалить", style: .destructive){ _ in
            DataService.shared.deleteContact(contact: self.contactEdit)
            self.navigationController?.popViewController(animated: true)
        })
        present(avc, animated: true)
    }

}
