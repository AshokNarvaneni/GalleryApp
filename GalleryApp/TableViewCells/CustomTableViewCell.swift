//
//  CustomTableViewCell.swift
//  GalleryApp
//
//  Created by Ashok Narvaneni on 16/02/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(tableViewCellViewModel: CustomTableViewCellViewModel) {
        nameLabel.text = tableViewCellViewModel.title
        categoryLabel.text = tableViewCellViewModel.category
        productImageView.loadImageFromUrl(urlString: tableViewCellViewModel.imageUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
