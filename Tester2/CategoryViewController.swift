//
//  ViewController.swift
//  Tester2
//
//  Created by CS Student on 4/10/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    var images: [CategoryCell] = [
        CategoryCell(image: UIImage(named: "Pose01.jpg")!, name: "Sitting Poses"),
        CategoryCell(image: UIImage(named: "Pose02.jpg")!, name: "two"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.CategoryCollectionView.delegate = self
        self.CategoryCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection_cell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.ImageView.image = images[indexPath.row].image
        cell.ImageLabel.text = images[indexPath.row].name
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // You can use indexPath to get "cell number x", or get the cell like:
        var temp = images[indexPath.row].name
        testLabel.text = temp
    }
}

