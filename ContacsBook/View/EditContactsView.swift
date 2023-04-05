//
//  EditContactsView.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

import UIKit

class EditContactsView: UIView {

//    private var doneButtonAction: (() -> ())!
//
//    private var cancelButtonAction: (() -> ())!

//    private lazy var doneButton: UILabel = {
//        let doneButton = UILabel()
//        doneButton.text = "Готово"
//        doneButton.textColor = .systemBlue
//        doneButton.isUserInteractionEnabled = true
//        doneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doneAction)))
//        doneButton.translatesAutoresizingMaskIntoConstraints = false
//        return doneButton
//    }()
//
//    private lazy var cancelButton: UILabel = {
//        let cancelButton = UILabel()
//        cancelButton.text = "Отменить"
//        cancelButton.textColor = .systemBlue
//        cancelButton.isUserInteractionEnabled = true
//        cancelButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelAction)))
//        cancelButton.translatesAutoresizingMaskIntoConstraints = false
//        return cancelButton
//    }()
//
//    private lazy var titleLabel: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.text = "Контакт"
//        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        titleLabel.textColor = .black
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        return titleLabel
//    }()

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField(frame: .zero)
        nameTextField.placeholder = "Имя контакта"
        generalSettingsForTextFild(nameTextField)
        nameTextField.keyboardType = .default
        nameTextField.delegate = self
        return nameTextField
    }()

    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField(frame: .zero)
        emailTextField.placeholder = "e-mail"
        generalSettingsForTextFild(emailTextField)
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        return emailTextField
    }()

    private lazy var phoneTextField: UITextField = {
        let phoneTextField = UITextField(frame: .zero)
        phoneTextField.placeholder = "номер телефона"
        generalSettingsForTextFild(phoneTextField)
        phoneTextField.keyboardType = .phonePad
        phoneTextField.delegate = self
        return phoneTextField
    }()

    private lazy var ageText: UILabel = {
        let labelText = UILabel()
        labelText.text = "Возраст:"
        labelText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        labelText.textColor = .black
        labelText.translatesAutoresizingMaskIntoConstraints = false
        return labelText
    }()

    lazy var agePicker: UIPickerView = {
        let agePicker = UIPickerView()
        agePicker.translatesAutoresizingMaskIntoConstraints = false
        return agePicker
    }()

    private lazy var genderText: UILabel = {
        let genderText = UILabel()
        genderText.text = "Пол:"
        genderText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        genderText.textColor = .black
        genderText.translatesAutoresizingMaskIntoConstraints = false
        return genderText
    }()

    lazy var genderPicker: UIPickerView = {
        let genderPicker = UIPickerView()
        genderPicker.translatesAutoresizingMaskIntoConstraints = false
        return genderPicker
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.addArrangedSubview(nameTextField)
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(phoneTextField)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var categoryPicker: UIPickerView = {
        let categoryPicker = UIPickerView()
        categoryPicker.translatesAutoresizingMaskIntoConstraints = false
        return categoryPicker
    }()

    private lazy var categoryText: UILabel = {
        let categoryText = UILabel()
        categoryText.text = "Категория:"
        categoryText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        categoryText.textColor = .black
        categoryText.translatesAutoresizingMaskIntoConstraints = false
        return categoryText
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

extension EditContactsView {

    private func setViews() {
        backgroundColor = .white
    }

    private func setConstraints() {
        addSubview(stack)
//        addSubview(doneButton)
//        addSubview(cancelButton)
//        addSubview(titleLabel)
        addSubview(ageText)
        addSubview(agePicker)
        addSubview(genderText)
        addSubview(genderPicker)
        addSubview(categoryText)
        addSubview(categoryPicker)
        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
//            doneButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            doneButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            cancelButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stack.heightAnchor.constraint(equalToConstant: 160),
            ageText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            ageText.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 50),
            agePicker.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16),
            agePicker.leadingAnchor.constraint(equalTo: ageText.trailingAnchor, constant: 4),
            agePicker.heightAnchor.constraint(equalToConstant: 90),
            agePicker.widthAnchor.constraint(equalToConstant: 100),
            genderText.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 50),
            genderText.leadingAnchor.constraint(equalTo: agePicker.trailingAnchor, constant: 10),
            genderPicker.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16),
            genderPicker.leadingAnchor.constraint(equalTo: genderText.trailingAnchor, constant: 4),
            genderPicker.heightAnchor.constraint(equalToConstant: 90),
            genderPicker.widthAnchor.constraint(equalToConstant: 140),

            categoryText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            categoryText.topAnchor.constraint(equalTo: agePicker.bottomAnchor, constant: 40),
            categoryPicker.topAnchor.constraint(equalTo: agePicker.bottomAnchor, constant: 8),
            categoryPicker.leadingAnchor.constraint(equalTo: categoryText.trailingAnchor, constant: 4),
            categoryPicker.widthAnchor.constraint(equalToConstant: 240),
            categoryPicker.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

}

extension EditContactsView: UITextFieldDelegate {

    private func generalSettingsForTextFild(_ textFild: UITextField) {
        textFild.backgroundColor = .systemGray6
        textFild.layer.cornerRadius = 10
        textFild.layer.borderWidth = 0.5
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.font = UIFont.systemFont(ofSize: 16)
        textFild.textColor = .black
        textFild.tintColor = UIColor(named: "ColorSet")
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.translatesAutoresizingMaskIntoConstraints = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}

extension EditContactsView {

//    func setView (doneButtonAction: @escaping () -> (), cancelButtonAction: @escaping () -> ()) {
//        self.doneButtonAction = doneButtonAction
//        self.cancelButtonAction = cancelButtonAction
//    }

    @objc func doneAction() {
        guard let nameText = nameTextField.text, let emailText = emailTextField.text, let phone = Int(phoneTextField.text ?? "") else { return }
        let newContact: Contact = Contact(name: nameText,
                                          email: emailText,
                                          age: 34,
                                          phone: phone,
                                          gender: true,
                                          category: .family)
        DataService.shared.saveContact(newContact) {
            print("ap op")
        }
        print(agePicker.selectedRow(inComponent: 0))
//        doneButtonAction()
    }

    func getData() ->(nameTextField: String?, emailTextField: String?, phoneTextField: String?) {
//        let data: (nameTextField: String?, emailTextField: String?, phoneTextField: String?) =
        (nameTextField.text, emailTextField.text, phoneTextField.text)
    }

//    @objc func cancelAction() {
//        cancelButtonAction()
//    }

}
