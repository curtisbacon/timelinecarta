//
//  TableViewController.swift
//  timelinecarta
//
//  Created by Curtis Bacon on 29/04/2015.
//  Copyright (c) 2015 Curtis Bacon. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [descriptionItem] = descriptionItem.getMOC()
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = true

        tableView.separatorStyle = .None
    }

}

extension TableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath) as! SecondCell
            
            let item = items[indexPath.row]
            cell.clipsToBounds = true
            cell.dateLabel.text = item.date
            cell.backgroundColor = UIColor.clearColor()
            cell.headingLabel.text = item.name
            cell.detailsLabel.text = item.title
            cell.ImageView.image = UIImage(named: item.filename)
            return cell
        default:
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            return cell
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return items.count
        default:
            return 0
        }
    }
    
}

extension TableViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 1 {
            let item = items[indexPath.row]
            item.selected = !item.selected
            tableView.beginUpdates()
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
            tableView.endUpdates()
            
            
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return UITableViewAutomaticDimension
        case 1:
            let item = items[indexPath.row]
            if item.selected {
                return UITableViewAutomaticDimension
            } else {
                return 100.0
            }
        default:
            return 0
        }
    }
    
}



class SecondCell: UITableViewCell {
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
}


