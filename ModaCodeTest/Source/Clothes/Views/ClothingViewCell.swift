//
//  ClothingViewCell.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

class ClothingViewCell: UICollectionViewCell {
    
    struct Constants {
        static let REUSE_IDENTIFIER = "Cell"
        static let CELL_SIZE : CGFloat = UIScreen.main.bounds.width * 0.5
        static let CELL_MARGIN : CGFloat = 10
        static let LABEL_HEIGHT : CGFloat = CELL_SIZE * 0.2
    }
    
    var imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect.zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var nameLabel: UILabel =  {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = App.Font.ralewayMedium(size: .Medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = App.Color.burgundy()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.text = nameText
    }
    
    var nameText : String = "" {
        didSet {
            self.setNeedsLayout()
        }
    }

}

//MARK: - Layout
extension ClothingViewCell {
    
    func layout() {
        
        contentView.backgroundColor = UIColor.white
        
        contentView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -Constants.CELL_MARGIN*2).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -Constants.CELL_MARGIN).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
     
        contentView.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -Constants.CELL_MARGIN).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.CELL_MARGIN).isActive = true
    }
    
}
