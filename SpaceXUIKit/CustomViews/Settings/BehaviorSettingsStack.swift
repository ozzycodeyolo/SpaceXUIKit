//
//  BehaviorSettingsStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class BehaviorSettingsStack: UIStackView {
    
    private let title: SectionTitleLabel = {
        return SectionTitleLabel(titled: "Behavior")
    }()
    let switchStack: LoadingSwitchStack = {
        return LoadingSwitchStack()
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = ConstraintsHelper.mediumSpacing
        alignment = .fill
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(switchStack)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
