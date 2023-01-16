//
//  PhotoTableViewCell.swift
//  AlamofireTestApp
//
//  Created by Talha Batuhan Irmalı on 16.01.2023.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    
    var photo: Photo! {
        didSet {
            self.photoTitle.text = self.photo.title
            self.photoImage.setImage(imageUrl: self.photo.url)
        }
    }
}
