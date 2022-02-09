//
//  DetailLinksStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 09.02.2022.
//

import UIKit

class DetailLinksStack: UIStackView {
    
    var links: ButtonLinks?

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .natural
        label.text = "Links"
        return label
    }()
    let articleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .large
        button.tintColor = .systemYellow
        button.setTitle("Article", for: .normal)
        return button
    }()
    let wikipediaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .large
        button.tintColor = .systemYellow
        button.setTitle("Wikipedia", for: .normal)
        return button
    }()
    let youtubeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .large
        button.tintColor = .systemYellow
        button.setTitle("Youtube", for: .normal)
        return button
    }()
    private lazy var writtenTextButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = ConstraintsHelper.smallSpacing
        return stack
    }()
    private lazy var allButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = ConstraintsHelper.smallSpacing
        return stack
    }()
    
    init(links: ButtonLinks) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        spacing = ConstraintsHelper.mediumSpacing
        axis = .vertical
        alignment = .center
        self.links = links
        // Add target to buttons
        articleButton.addTarget(self, action: #selector(handleArticle), for: .touchUpInside)
        wikipediaButton.addTarget(self, action: #selector(handleWiki), for: .touchUpInside)
        youtubeButton.addTarget(self, action: #selector(handleYoutube), for: .touchUpInside)
        // Add subviews
        addArrangedSubview(titleLabel)
        addArrangedSubview(allButtonsStack)
        allButtonsStack.addArrangedSubview(writtenTextButtonsStack)
        allButtonsStack.addArrangedSubview(youtubeButton)
        writtenTextButtonsStack.addArrangedSubview(articleButton)
        writtenTextButtonsStack.addArrangedSubview(wikipediaButton)
        // UI Constraints
        NSLayoutConstraint.activate([
            articleButton.topAnchor.constraint(equalTo: writtenTextButtonsStack.topAnchor),
            articleButton.bottomAnchor.constraint(equalTo: writtenTextButtonsStack.bottomAnchor),
            articleButton.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutSmallPaddingAndSpacingDividedByTwo),
            wikipediaButton.topAnchor.constraint(equalTo: writtenTextButtonsStack.topAnchor),
            wikipediaButton.bottomAnchor.constraint(equalTo: writtenTextButtonsStack.bottomAnchor),
            wikipediaButton.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutSmallPaddingAndSpacingDividedByTwo),
            youtubeButton.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutPadding),
            writtenTextButtonsStack.leadingAnchor.constraint(equalTo: allButtonsStack.leadingAnchor),
            writtenTextButtonsStack.trailingAnchor.constraint(equalTo: allButtonsStack.trailingAnchor),
            allButtonsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            allButtonsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutPadding)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailLinksStack {
    
    @objc
    func handleArticle() {
        guard let links = links else { fatalError("This really did not work as expected") }
        UIApplication.shared.open(links.articleURL)
    }
    
    @objc
    func handleWiki() {
        guard let links = links else { fatalError("This really did not work as expected") }
        UIApplication.shared.open(links.wikipediaURL)
    }
    
    @objc
    func handleYoutube() {
        guard let links = links else { fatalError("This really did not work as expected") }
        UIApplication.shared.open(links.youtubeURL)
    }
    
}

