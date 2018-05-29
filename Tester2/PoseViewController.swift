//
//  PoseViewController.swift
//  Tester2
//
//  Created by CS Student on 4/25/18.
//  Copyright © 2018 CS Student. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class PoseViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    // collection view
    @IBOutlet weak var PoseCollectionView: UICollectionView!
    
    var db: Firestore!
    var storage: Storage!;
    
    var labels = [ImageCell]()
    
    var testString: String = ""
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(testString)
        testLabel.text = testString
        
        db = Firestore.firestore();
        storage = Storage.storage();
        
        DispatchQueue.main.async {
            self.loadData()
        }
        
        self.PoseCollectionView.delegate = self
        self.PoseCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        PoseCollectionView.reloadData()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
        //labels for images, texts, and labels
        cell.poseImageView.image = labels[indexPath.row].image
        cell.poseNameLabel.text = labels[indexPath.row].name
        cell.poseDescriptionLabel.text = labels[indexPath.row].description
        //Displays cell
        return cell
        
    }
 
    
    func loadData() {
        
        let userRef = db.collection(testString);
        userRef.getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    var name = "";
                    var image: UIImage? = nil;
                    
                    let url = document.get("url") as? String
                    let identifier = document.get("identifier") as? String
                    
                    let storageRef = self.storage.reference(forURL: url!)
                    // print(storageRef.name)
                    name = storageRef.name
                    storageRef.getData(maxSize: 1 * 2048 * 2048) { data, error in
                        if let error = error {
                            print(error)
                        } else {
                            // Data for "images/island.jpg" is returned
                            image = UIImage(data: data!)
                            self.labels.append(ImageCell(image: UIImage(data: data!)!, name: name, description: identifier!))
                            self.PoseCollectionView.reloadData()
                            
                        }
                    }
                }
            }
        }
    }
}
