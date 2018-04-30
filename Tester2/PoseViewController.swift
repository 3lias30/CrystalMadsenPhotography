//
//  PoseViewController.swift
//  Tester2
//
//  Created by CS Student on 4/25/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit

class PoseViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var PoseCollectionView: UICollectionView!
    var labels: [ImageCell] = [
        ImageCell(image: UIImage(named: "one.png")!, name: "two", description: "Test", favorite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PoseCollectionView.delegate = self
        self.PoseCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! PoseCollectionViewCell
        
        cell.poseImageView.image = labels[indexPath.row].image
        cell.poseNameLabel.text = labels[indexPath.row].name
        cell.poseDescriptionLabel.text = labels[indexPath.row].description
        
        return cell
        
    }
}