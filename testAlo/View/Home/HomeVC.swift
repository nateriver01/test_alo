//
//  HomeVC.swift
//  testAlo
//
//  Created by hamidurrahman on 13/05/19.
//  Copyright © 2019 hamidurrahman. All rights reserved.
//

import UIKit
import SwiftPhotoGallery

class HomeVC: UIViewController, SwiftPhotoGalleryDataSource, SwiftPhotoGalleryDelegate{
    @IBOutlet var ivCollectionHome: [UIImageView]!
    
    var imageCollection1:[UIImage] = [UIImage(imageLiteralResourceName: "cat1"),UIImage(imageLiteralResourceName: "cat2"),UIImage(imageLiteralResourceName: "cat3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initLayout()
    }
    
    private func initLayout(){
        
        for i in 0..<ivCollectionHome.count{
            ivCollectionHome[i].image = imageCollection1[i]
            // Init back button at nav bar
            ivCollectionHome[i].isUserInteractionEnabled = true
            let tapShowImageGallery = UITapGestureRecognizer(target: self, action: #selector(showGallery(sender:)))
            ivCollectionHome[i].addGestureRecognizer(tapShowImageGallery)
        }
    }
    
    //onTap image function
    @objc private func showGallery(sender:UITapGestureRecognizer) {
        
        print("1")
        
        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)
        
        gallery.backgroundColor = UIColor.black
        gallery.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        gallery.currentPageIndicatorTintColor = UIColor.white
        gallery.hidePageControl = false
        
        present(gallery, animated: true, completion: nil)
        
    }
    
    func numberOfImagesInGallery(gallery: SwiftPhotoGallery) -> Int {
        return imageCollection1.count
    }
    
    func imageInGallery(gallery: SwiftPhotoGallery, forIndex: Int) -> UIImage? {
        return imageCollection1[forIndex]
    }
    
    // MARK: SwiftPhotoGalleryDelegate Methods
    
    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismiss(animated: true, completion: nil)
    }
    

}
