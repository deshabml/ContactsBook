//
//  EditContactsView.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

import UIKit

class EditContactsView: UIView {

    private lazy var doneButton: UILabel = {
        let doneButton = UILabel()
        doneButton.text = "Готово"
        doneButton.textColor = UIColor(
            red: 255/255,
            green: 59/255,
            blue: 48/255,
            alpha: 1.0)
        doneButton.isUserInteractionEnabled = true
        doneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doneButtonAction)))
//        if let habit = habit {
//            return doneButton
//        } else {
//            doneButton.isHidden = true
//        }
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        return doneButton
    }()

    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField(frame: .zero)
        nameTextField.placeholder = "Имя контакта"
        generalSettingsForTextFild(nameTextField)
        nameTextField.delegate = self
        return nameTextField
    }()

    private lazy var emailTextField: UITextField = {
        let emailTextField = UITextField(frame: .zero)
        emailTextField.placeholder = "e-mail"
        generalSettingsForTextFild(emailTextField)
        emailTextField.delegate = self
        return emailTextField
    }()

    private lazy var phoneTextField: UITextField = {
        let phoneTextField = UITextField(frame: .zero)
        phoneTextField.placeholder = "номер телефона"
        generalSettingsForTextFild(phoneTextField)
        phoneTextField.delegate = self
        return phoneTextField
    }()

    private lazy var ageText: UILabel = {
        let labelText = UILabel()
        labelText.text = "Возраст:"
        labelText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        labelText.textColor = .black
//        labelText.translatesAutoresizingMaskIntoConstraints = false
        return labelText
    }()

    lazy var agePicker: UIPickerView = {
        let agePicker = UIPickerView()
//        agePicker.locale = .current
//        agePicker.preferredDatePickerStyle = .wheels
//        agePicker.addTarget(self, action: #selector(pickerAction), for: .allEvents)
        return agePicker
    }()

    private lazy var genderText: UILabel = {
        let genderText = UILabel()
        genderText.text = "Пол:"
        genderText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        genderText.textColor = .black
//        labelText.translatesAutoresizingMaskIntoConstraints = false
        return genderText
    }()

    lazy var genderPicker: UIPickerView = {
        let genderPicker = UIPickerView()
//        agePicker.locale = .current
//        agePicker.preferredDatePickerStyle = .wheels
//        agePicker.addTarget(self, action: #selector(pickerAction), for: .allEvents)
        return genderPicker
    }()

//    private lazy var phoneTextField: UITextField = {
//        let emailTextField = UITextField(frame: .zero)
//        emailTextField.placeholder = "e-mail"
//        generalSettingsForTextFild(emailTextField)
//        emailTextField.delegate = self
//        return emailTextField
//    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.addArrangedSubview(nameTextField)
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(phoneTextField)
        stack.addArrangedSubview(stackAge)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var stackAge: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.addArrangedSubview(ageText)
        stack.addArrangedSubview(agePicker)
        stack.addArrangedSubview(genderText)
        stack.addArrangedSubview(genderPicker)
//        stack.translatesAutoresizingMaskIntoConstraints = false
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

extension EditContactsView {

    private func setViews() {
        backgroundColor = .white
    }

    private func setConstraints() {
        addSubview(stack)
        addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            doneButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stack.heightAnchor.constraint(equalToConstant: 300)
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
        textFild.keyboardType = .asciiCapable
        textFild.translatesAutoresizingMaskIntoConstraints = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}

extension EditContactsView {

    @objc func doneButtonAction() {
        print("ap_op")
        print(agePicker.selectedRow(inComponent: 0))
    }

}
