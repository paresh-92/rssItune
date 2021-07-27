//
//  CustomCell.swift
//  DemoRSSItunes
//
//  Created by Paresh Thakkar on 25/07/21.
//

import UIKit

class CustomCell: UITableViewCell {
    
static let cellIdentifier = "CustomTableviewCell"
    
    let lblArtistName = UILabel()
    let imgView = UIImageView()
    let lblAlbumName = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()

        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubview(imgView)
        contentView.addSubview(lblArtistName)
        contentView.addSubview(lblAlbumName)
        
        imgView.frame = CGRect(x: 0, y: 15, width: 70, height: 70)
        imgView.layer.borderWidth = 0.2
        imgView.layer.cornerRadius = layer.cornerRadius/2
        imgView.layer.cornerRadius = imgView.frame.size.height / 2
        imgView.layer.masksToBounds = false
        imgView.clipsToBounds = true
        
        lblAlbumName.frame = CGRect(x: 80, y: 25, width: 280, height: 30)
        lblAlbumName.numberOfLines = 2
//        lblAlbumName.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
//        lblArtistName.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        lblArtistName.frame = CGRect(x: 80, y: 55, width: 300, height: 30)
        lblAlbumName.font = .systemFont(ofSize: 14, weight: .semibold)
        lblAlbumName.textColor = .black
        lblAlbumName.textAlignment = .left
        lblArtistName.font = .systemFont(ofSize: 14, weight: .medium)
        lblArtistName.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lblArtistName.textAlignment = .left
        lblArtistName.numberOfLines = 2
        
    }
}
