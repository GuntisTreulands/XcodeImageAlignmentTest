//
//  KazooTableViewCell.swift
//  testImageAlignment
//
//  Created by Guntis on 09/07/2019.
//

import UIKit

enum cellBackgroundType: Int {
	case top = 0
	case middle = 1
	case bottom = 2
	case single = 3
}

class KazooTableViewCell: UITableViewCell {

	public var cellBgType: cellBackgroundType = .single
	
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	var bgViewBottomAnchorConstraint: NSLayoutConstraint?
	var bgViewTopAnchorConstraint: NSLayoutConstraint?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        
        backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 28.5).isActive = true
		backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -28.5).isActive = true
		bgViewBottomAnchorConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		bgViewBottomAnchorConstraint?.isActive = true
		bgViewTopAnchorConstraint = backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor)
		bgViewTopAnchorConstraint?.isActive = true
		
		iconImageView.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor, constant: 10).isActive = true
		iconImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 10).isActive = true
		iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
		iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		
		titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10).isActive = true
		titleLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 5).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor, constant: -10).isActive = true
		
		descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10).isActive = true
		descriptionLabel.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor, constant: -10).isActive = true
		descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
		descriptionLabel.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -5).isActive = true
    }
	
	func setAsCellType(cellType: cellBackgroundType) {
		switch cellType {
			case .top:
				self.bgViewTopAnchorConstraint?.constant = 28.5
				self.bgViewBottomAnchorConstraint?.constant = 0
				backgroundImageView.image = UIImage.init(named: "cell_bg_top")
				break
			case .bottom:
				self.bgViewTopAnchorConstraint?.constant = 0
				self.bgViewBottomAnchorConstraint?.constant = -28.5
				backgroundImageView.image = UIImage.init(named: "cell_bg_bottom")
				break
			case .middle:
				self.bgViewTopAnchorConstraint?.constant = 0
				self.bgViewBottomAnchorConstraint?.constant = 0
				backgroundImageView.image = UIImage.init(named: "cell_bg_middle")
				break
			case .single:
				self.bgViewTopAnchorConstraint?.constant = 28.5
				self.bgViewBottomAnchorConstraint?.constant = -28.5
				backgroundImageView.image = UIImage.init(named: "cell_bg_single")
		}
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
