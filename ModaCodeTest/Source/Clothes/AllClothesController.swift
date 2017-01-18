//
//  AllClothesController.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

class AllClothesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let sectionInsets = UIEdgeInsets(top: ClothingViewCell.Constants.CELL_MARGIN, left: ClothingViewCell.Constants.CELL_MARGIN, bottom: ClothingViewCell.Constants.CELL_MARGIN, right: ClothingViewCell.Constants.CELL_MARGIN)
    
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    var clothingCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsetsMake(ClothingViewCell.Constants.CELL_MARGIN, ClothingViewCell.Constants.CELL_MARGIN, ClothingViewCell.Constants.CELL_MARGIN, ClothingViewCell.Constants.CELL_MARGIN)
//        layout.itemSize = CGSize(width: ClothingViewCell.Constants.CELL_SIZE, height: ClothingViewCell.Constants.CELL_SIZE)

        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.backgroundColor = .gray
        return cv
    }()
    
    
    let store = ClothingDataStore.sharedInstance
    var listOfClothing = [Clothing]()
    let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        wire()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        clothingCollectionView.addSubview(activityIndicator)
        activityIndicator.frame = clothingCollectionView.bounds
        activityIndicator.startAnimating()
        
        if self.store.modaClothingArray.count == 0 {
            self.clothingCollectionView.reloadData()
        }
        updateCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func updateCollectionView() {
        store.getClothesWithCompletion {
            self.listOfClothing = self.store.modaClothingArray
            
            DispatchQueue.main.async(execute: { () -> Void in
                self.activityIndicator.stopAnimating()
                self.clothingCollectionView.reloadData()
            })
        }
    }
}

//MARK: - Layout
extension AllClothesController {
    func layout() {
        title = "Moda Operandi"
        view.backgroundColor = .white
        
        view.addSubview(clothingCollectionView)
        clothingCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clothingCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        clothingCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        clothingCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}

//MARK: - Wire
extension AllClothesController {
    func wire() {
        clothingCollectionView.dataSource = self
        clothingCollectionView.delegate = self
        clothingCollectionView.register(ClothingViewCell.self, forCellWithReuseIdentifier: ClothingViewCell.Constants.REUSE_IDENTIFIER)
    }
}

//MARK: - UICollectionViewDataSource
extension AllClothesController {
    
    @objc(numberOfSectionsInCollectionView:) func numberOfSections(in collectionView: UICollectionView) -> Int {
        return listOfClothing.count
    }
    
    func collectionView(_ coldslectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothingViewCell.Constants.REUSE_IDENTIFIER, for: indexPath) as? ClothingViewCell
    
        let clothing = self.listOfClothing[indexPath.row]
        cell?.backgroundColor = UIColor.blue
        
        
        let imgURL = NSURL(fileURLWithPath: clothing.photoURL)
        getDataFromUrl(link: imgURL as URL) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                cell?.imageView.image = UIImage(data: data)!
            }
        }
        
        cell?.nameLabel.text = clothing.name
        
        return cell!
    }
    
    //Get Image from URL
    func getDataFromUrl(link: URL, completion: @escaping (_ data: Data?,
        _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: link) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}

extension AllClothesController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.left
    }
    
}
