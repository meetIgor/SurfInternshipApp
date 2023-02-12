//
//  ViewController.swift
//  SurfInternshipApp
//
//  Created by igor s on 11.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.backgroundImage)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        let internshipViewController = InternshipViewController()
        if let sheet = internshipViewController.sheetPresentationController {
            let small = UISheetPresentationController.Detent.custom { context in
                UIScreen.main.bounds.height * 0.41
            }
            sheet.detents = [small]
            sheet.preferredCornerRadius = 32
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        internshipViewController.isModalInPresentation = true
        present(internshipViewController, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(
                equalTo: backgroundImage.widthAnchor,
                multiplier: 1.4
            )
        ])
    }
}

