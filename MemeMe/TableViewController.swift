//
//  TableViewController.swift
//  MemeMe
//
//  Created by Jaekwang Seo on 10/5/16.
//  Copyright © 2016 Jaekwang Seo. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topNavigationController = parentViewController?.parentViewController {
            
            topNavigationController.title = Constants.AppName
            let addMemeButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addMeme))
            topNavigationController.navigationItem.rightBarButtonItem = addMemeButton
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func addMeme() {
        
        let memeEditorVC = storyboard!.instantiateViewControllerWithIdentifier("MemeEditorVC")
        self.presentViewController(memeEditorVC, animated: true, completion: nil)
    }
    
    
    // TableViewDelegates, TableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        if let cell = tableView.dequeueReusableCellWithIdentifier("TableCell") {
            cell.textLabel?.text = memes[indexPath.row].topText + " " + memes[indexPath.row].bottomText
            cell.imageView?.image = memes[indexPath.row].memedImage
            return cell
        }
        
        return UITableViewCell()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailVC  = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! MemeDetailViewController
        detailVC.meme = memes[indexPath.row]
        self.parentViewController!.navigationController?.pushViewController(detailVC, animated: true)
    }
}
