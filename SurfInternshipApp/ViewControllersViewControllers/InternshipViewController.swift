//
//  InternshipViewController.swift
//  SurfInternshipApp
//
//  Created by igor s on 12.02.2023.
//

import UIKit

class InternshipViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Стажировка в Surf"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var header: UILabel = {
        createHeaderLabel(with: "Работай над реальными задачами под руководством опытного наставника и получи вохможность стать частью команды мечты.", linesAmount: 0)
    }()
    
    private lazy var question: UILabel = {
        createHeaderLabel(with: "Хочешь к нам?", linesAmount: 1)
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.numberOfLines = 1
        button.configuration = UIButton.Configuration.filled()
        button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        var attrText = AttributedString.init("Отправить заявку")
        attrText.font = UIFont.systemFont(ofSize: 16)
        attrText.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.configuration?.attributedTitle = attrText
        button.configuration?.cornerStyle = .capsule
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(
            top: 20, leading: 44, bottom: 20, trailing: 44
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(self.sendButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [question, sendButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private var intershipCollectionView = InternshipCollectionView()
    
    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(header)
        view.addSubview(intershipCollectionView)
        view.addSubview(stackView)
        setConstraints()
    }
    
    // MARK: - Public Methods
    
    @objc func sendButtonPressed() {
        showAlert(
            with: "Поздравляем!",
            and: "Ваша заявка успешно отправлена!")
    }
    
    // MARK: - Private Methods
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        intershipCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            intershipCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            intershipCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            intershipCollectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            intershipCollectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeight)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func createHeaderLabel(with text: String, linesAmount: Int ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = linesAmount
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.5882352941, green: 0.5843137255, blue: 0.6078431373, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

// MARK: - AlertController Extension

extension InternshipViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Закрыть", style: .default)
        alert.addAction(closeAction)
        present(alert, animated: true)
    }
}
