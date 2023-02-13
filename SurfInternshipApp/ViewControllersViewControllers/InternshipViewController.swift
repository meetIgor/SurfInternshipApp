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
        label.text = Constants.title
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var header: UILabel = {
        createLabel(with: Constants.headerText, linesAmount: 0)
    }()
    
    private lazy var question: UILabel = {
        createLabel(with: Constants.questionText, linesAmount: 1)
    }()
    
    private lazy var sendButton: UIButton = {
        createSendButton(with: Constants.buttonTitle, action: UIAction { [unowned self] _ in
            sendButtonPressed()
        }
        )
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
        setupSubviews(titleLabel, header, intershipCollectionView, stackView)
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupConstraints() {
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
            stackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20
            ),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func createLabel(with text: String, linesAmount: Int ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = linesAmount
        label.contentMode = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.5882352941, green: 0.5843137255, blue: 0.6078431373, alpha: 1)
        return label
    }
    
    private func createSendButton(with title: String, action: UIAction) -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.systemFont(ofSize: 16)
        attributes.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attributes)
        buttonConfiguration.cornerStyle = .capsule
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(
            top: 20, leading: 44, bottom: 20, trailing: 44
        )
        
        return UIButton(configuration: buttonConfiguration, primaryAction: action)
    }
    
    private func sendButtonPressed() {
        showAlert(
            with: "Поздравляем!",
            and: "Ваша заявка успешно отправлена!")
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
