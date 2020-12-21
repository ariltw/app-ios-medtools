//
//  ImageBannerView.swift
//  MedTools
//
//  Created by Ariel on 18/12/20.
//

import UIKit

class ImageBannerView: UITableViewCell {
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var titleBanner: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(title: String, image: String) {
        imageBanner.image = UIImage(named: image)
        titleBanner.text = title
    }
}
