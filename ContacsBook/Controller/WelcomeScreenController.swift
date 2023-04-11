//
//  WelcomeScreenController.swift
//  ContacsBook
//
//  Created by Лаборатория on 06.04.2023.
//

import UIKit

class WelcomeScreenController: UIViewController {

    private lazy var exitImage: UIButton = {
        let exitImage = UIButton()
        exitImage.setImage(UIImage(systemName: "xmark"), for: .normal)
        exitImage.addTarget(self,
                            action: #selector(buttonExitPressed),
                            for: .touchUpInside)
        exitImage.translatesAutoresizingMaskIntoConstraints = false
        return exitImage
    }()

    private lazy var labelText: UILabel = {
        let labelText = UILabel()
        labelText.text = "Спасибо, что выбрали наше приложение!"
        labelText.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        labelText.textColor = .black
        labelText.numberOfLines = 0
        labelText.translatesAutoresizingMaskIntoConstraints = false
        return labelText
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

}

extension WelcomeScreenController {

    func setViews() {
        view.backgroundColor = .yellow
    }

    func setConstraints() {
        view.addSubview(exitImage)
        view.addSubview(labelText)
        NSLayoutConstraint.activate([
            exitImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            exitImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            labelText.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            labelText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelText.widthAnchor.constraint(equalToConstant: 250)
        ])
    }

    @objc func buttonExitPressed() {
        DataService.shared.firstTimeFalse(true)
        navigationController?.popViewController(animated: true)
    }

}
