//
//  HomeCollectionViewCell.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var ivItem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    func updateCell(data: Result) {
        lblItem.text = data.trackName
        ivItem.kf.setImage(with: URL(string: data.artworkUrl100), placeholder: UIImage(named: "loading_placeholder"))
    }

}
