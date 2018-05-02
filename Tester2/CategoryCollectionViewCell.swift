 //
//  MyCollectionViewCell.swift
//  Tester2
//
//  Created by CS Student on 4/12/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageLabel: UILabel!
 }
 
 class CategoryCell {
    var image : UIImage!;
    var name : String = "";
    
    init(image: UIImage, name: String) {
        self.image = image;
        self.name = name;
    }
 }

 
