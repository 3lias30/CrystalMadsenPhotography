//
//  PoseCollectionViewCell.swift
//  Tester2
//
//  Created by CS Student on 4/25/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit

class PoseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var poseImageView: UIImageView!
    @IBOutlet weak var poseNameLabel: UILabel!
    @IBOutlet weak var poseDescriptionLabel: UILabel!
    @IBOutlet weak var poseFaovriteBool: UILabel!
}

//Creates cells for the image placement
class ImageCell {
    var image: UIImage;
    var name: String = "";
    var description: String = "";
    
    init(image: UIImage, name: String, description: String) {
        self.image = image;
        self.name = name;
        self.description = description;
        
    }
}
