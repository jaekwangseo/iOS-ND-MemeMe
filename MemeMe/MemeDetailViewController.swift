//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Jaekwang Seo on 10/6/16.
//  Copyright © 2016 Jaekwang Seo. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme?
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let meme = meme {
            memeImageView.image = meme.memedImage
        }
    }
}
