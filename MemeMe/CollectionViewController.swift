//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Jaekwang Seo on 10/5/16.
//  Copyright © 2016 Jaekwang Seo. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        configureCellSize()
    }
    
    func configureCellSize() {
        let space: CGFloat = 3.0
        
        var dimension: CGFloat
        let frameWidth = self.view.frame.size.width
        let frameHeight = self.view.frame.size.height
        
        if frameWidth < frameHeight {
            dimension = (self.view.frame.size.width - (2 * space)) / 3.0
        } else {
            dimension = (self.view.frame.size.width - (4 * space)) / 5.0
        }
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath)
        let meme = memes[indexPath.item]
        let imageView = UIImageView(image: meme.memedImage)
        imageView.contentMode = .ScaleAspectFill
        cell.backgroundView = imageView
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let detailVC  = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! MemeDetailViewController
        detailVC.meme = memes[indexPath.row]
        self.parentViewController!.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}