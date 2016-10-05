//
//  TableViewController.swift
//  MemeMe
//
//  Created by Jaekwang Seo on 10/5/16.
//  Copyright © 2016 Jaekwang Seo. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController {
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let parent = parentViewController {
            print("parent")
        }
    }
    
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
