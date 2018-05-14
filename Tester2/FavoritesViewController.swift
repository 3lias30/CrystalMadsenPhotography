//
//  FavoritesViewController.swift
//  Tester2
//
//  Created by CS Student on 5/3/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit



class FavoritesViewController: UIViewController ,  UICollectionViewDelegate, UICollectionViewDataSource{
    
    var testThingy: [testCell] = [
        testCell(image2: UIImage(named: "Pose03.jpg")!)
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testThingy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell2", for: indexPath) as! FavoritesCollectionViewCell
        
        cell2.imageView.image = testThingy[indexPath.row].image2
        
        return cell2
    }
    

    @IBOutlet weak var FavoriteCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.FavoriteCollectionView.delegate = self
        self.FavoriteCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
