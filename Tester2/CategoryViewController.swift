//
//  CategoryViewController.swift
//  Tester2
//
//  Created by CS Student on 4/10/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var db: Firestore!
    var storage: Storage!;
    
    var images = [CategoryCell]()
    

    /*
    @IBAction func testFavsButton(_ sender: Any) {
        performSegue(withIdentifier: "testButton", sender: self)
    }
    */
    
    @IBOutlet weak var tommyLabel: UILabel!
    
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    /*Creates names for images in each cell*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore();
        storage = Storage.storage();
        
        DispatchQueue.main.async {
            self.loadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
        //Assigns the collection views to the class
        self.CategoryCollectionView.dataSource = self
        self.CategoryCollectionView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        CategoryCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        
        //Creates view images for categories
        cell.ImageView.image = images[indexPath.row].image
       //Creates view texts for categories
        cell.ImageLabel.text = images[indexPath.row].ImageName
        
        //returns the image and text
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // You can use indexPath to get "cell number x", or get the cell like:
        let temp = images[indexPath.row].ImageName
        tommyLabel.text = temp
    }
    
    func loadData() {
        
        let userRef = db.collection("Categories");
        userRef.getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    var name = "";
                    
                    let url = document.get("url") as? String
                    let identifier = document.get("identifier") as? String
                    
                    let storageRef = self.storage.reference(forURL: url!)
                    // print(storageRef.name)
                    name = storageRef.name
                    storageRef.getData(maxSize: 1 * 2048 * 2048) { data, error in
                        if let error = error {
                            print(error)
                        } else {

                            self.images.append(CategoryCell(image: UIImage(data: data!)!, name: name, iD: identifier!))
                            self.CategoryCollectionView.reloadData()
                            
                        }
                    }
                }
            }
        }
    }
}

