//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Jaekwang Seo on 10/5/16.
//  Copyright © 2016 Jaekwang Seo. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }

}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}