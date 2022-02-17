//
//  CrewCollectionLayoutProvider.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 16.02.2022.
//

import UIKit

final class CrewCollectionLayoutProvider {
    
    let sectionHeaders: [NSCollectionLayoutBoundarySupplementaryItem] = {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        var headers: [NSCollectionLayoutBoundarySupplementaryItem] = []
        for section in Section.allCases {
            headers.append(NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: section.rawValue, alignment: .top))
        }
        return headers
    }()
    
    lazy var collectionLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let columns = sectionIndex == 0 ? 3 : 2
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                              subitem: item,
                                                                count: columns)
            
            group.interItemSpacing = .fixed(ConstraintsHelper.padding)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = ConstraintsHelper.padding
            section.boundarySupplementaryItems = [self.sectionHeaders[sectionIndex]]
            section.contentInsets = NSDirectionalEdgeInsets(top: ConstraintsHelper.padding, leading: 0, bottom: ConstraintsHelper.padding * 3, trailing: 0)
            
            return section
        }
        return layout
    }()
    
}