//
//  FlightCell.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

final class FlightCell: UITableViewCell {
    
    static let reusableID: String = "flightCell"
    var flightData: FlightCellData? {
        didSet {
            patchImageView.image = flightData?.image ?? UIImage(named: "falconHeavy")
            dateLabel.text = flightData?.date
            titleLabel.text = flightData?.title
        }
    }
    
    private let patchImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemYellow
        imageView.image = UIImage(systemName: "airplane.circle")
        return imageView
    }()
    private let infoStack: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillProportionally
        return stack
    }()
    private let dateLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .secondaryLabel
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    private let cellStack: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = ConstraintsHelper.padding
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Subviews
        infoStack.addArrangedSubview(dateLabel)
        infoStack.addArrangedSubview(titleLabel)
        cellStack.addArrangedSubview(patchImageView)
        cellStack.addArrangedSubview(infoStack)
        contentView.addSubview(cellStack)
        // UI Configuration
        let size: CGFloat = 50
        NSLayoutConstraint.activate([
            // PATCH IMAGE
            patchImageView.widthAnchor.constraint(equalToConstant: size),
            patchImageView.heightAnchor.constraint(equalToConstant: size),
            // DATE
            dateLabel.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
            // FLIGHT TITLE
            titleLabel.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
            // STACK
            cellStack.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor),
            cellStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstraintsHelper.padding),
            cellStack.trailingAnchor.constraint(equalTo: contentView.readableContentGuide.trailingAnchor),
            cellStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ConstraintsHelper.padding),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        flightData = nil
    }

}
