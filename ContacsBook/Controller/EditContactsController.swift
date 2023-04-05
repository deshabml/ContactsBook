//
//  EditContactsController.swift
//  ContacsBook
//
//  Created by Лаборатория on 05.04.2023.
//

import UIKit

class EditContactsController: UIViewController {

    let mainView = EditContactsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

}

extension EditContactsController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == mainView.agePicker {
            return 150
        } else {
            return 2
        }
    }

}

extension EditContactsController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == mainView.agePicker {
            return "\(row + 1)"
        } else {
            if row == 0 {
                return "Мужской"
            } else {
                return "Женский"
            }
        }
    }

}

extension EditContactsController {

    func setView() {
        mainView.agePicker.dataSource = self
        mainView.agePicker.delegate = self
        mainView.genderPicker.dataSource = self
        mainView.genderPicker.delegate = self
        view = mainView
        view.backgroundColor = .yellow
    }

}
