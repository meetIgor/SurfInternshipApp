//
//  InternshipCollectionView.swift
//  SurfInternshipApp
//
//  Created by igor s on 12.02.2023.
//

import UIKit

class InternshipCollectionView:
    UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Private Properties
    
    private var pressState = false
    
    private var internshipTypes = [
        "iOS", "Android", "Design", "Flutter", "QA",
        "PM", "Go-lang", "FrontEnd", "HR", "Finance"
    ]
    
    // MARK: - Initializers
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        register(InternshipCollectionViewCell.self, forCellWithReuseIdentifier: InternshipCollectionViewCell.cellID)
        
        layout.minimumLineSpacing = Constants.minimumLineSpacing
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.collectionViewLayout = layout
        contentInset = UIEdgeInsets(
            top: 0, left: Constants.leftDistanceToView,
            bottom: 0, right: Constants.rightDistanceToView
        )
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        internshipTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: InternshipCollectionViewCell.cellID,
                for: indexPath
            )
                as? InternshipCollectionViewCell else { return UICollectionViewCell() }
        cell.title.text = internshipTypes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !pressState || indexPath.row != 0 {
            moveItem(at: indexPath, to: IndexPath(row: 0, section: 0))
            let itemToMove = internshipTypes.remove(at: indexPath.row)
            internshipTypes.insert(itemToMove, at: 0)
            pressState = true
        } else {
            deselectItem(at: indexPath, animated: true)
            pressState = false
        }
    }
}
