//
//  CategoryViewController.swift
//  Tester2
//
//  Created by CS Student on 4/10/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit
// import Firebase
// import FirebaseStorage

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   // var db: Firestore!;
    
    //var storage: Storage!;
    
    var images: [CategoryCell] = [
        CategoryCell(image: UIImage(named: "Pose01.jpg")!, name: "test", iD: "001"),
        CategoryCell(image: UIImage(named: "Pose02.jpg")!, name: "test2", iD: "002")
    ]
    

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
        // Do any additional setup after loading the view, typically from a nib.
        //Assigns the collection views to the class
        self.CategoryCollectionView.delegate = self
        self.CategoryCollectionView.dataSource = self
        
        /*
        db = Firestore.firestore();
        storage = Storage.storage();
        let userRef = db.collection("Categories");
        userRef.getDocuments() { (querySnapshot, err) in

            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    var name = "";
                    var image: UIImage? = nil;
                    
                    let url = document.get("url") as? String
                    let storageRef = self.storage.reference(forURL: url!)
                    // print(storageRef.name)
                    name = storageRef.name
                    storageRef.getData(maxSize: 1 * 2048 * 2048) { data, error in
                        if let error = error {
                            print(error)
                        } else {
                            // Data for "images/island.jpg" is returned
                            image = UIImage(data: data!)
                            self.images.append(CategoryCell(image: UIImage(data: data!)!, name: name, iD: "" ))
                            print(name)
                            
                        }
                    }
                }
            }
        }
        CategoryCollectionView.reloadData()
         */
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection_cell", for: indexPath) as! CategoryCollectionViewCell
        
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
}

