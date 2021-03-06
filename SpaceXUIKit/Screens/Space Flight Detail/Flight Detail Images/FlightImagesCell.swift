//
//  FlightImagesCell.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 25.02.2022.
//

import UIKit

class FlightImagesCell: UITableViewCell {
    
    static let reuseID: String = "flightImagesCell"
    
    let flightImageView: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        return imgView
    }()
    lazy var imageHeightConstraint = flightImageView.heightAnchor.constraint(equalToConstant: 150)
    lazy var imageWidthConstraint = flightImageView.widthAnchor.constraint(equalToConstant: 150)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Subviews
        contentView.addSubview(flightImageView)
        // UI Config
        NSLayoutConstraint.activate([
//            flightImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            flightImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            flightImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            flightImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstraintsHelper.tinySpacing),
            flightImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ConstraintsHelper.tinySpacing),
            imageWidthConstraint,
            imageHeightConstraint,
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        let imageRatio = flightImageView.image!.size.height / flightImageView.image!.size.width
        if selected {
            contentView.backgroundColor = .systemBackground
        } else {
            imageHeightConstraint.constant = ConstraintsHelper.screenSizeWithoutPadding * imageRatio
            
        }
    }

}
