//
//  TableViewController.swift
//  timelinecarta
//
//  Created by Curtis Bacon on 29/04/2015.
//  Copyright (c) 2015 Curtis Bacon. All rights reserved.
//

import UIKit

//  Create a Table View Controller in the storyboard, using prototype cells and link it to this swift file using a class

class TableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    //  call array of content from description app file and then call it here as a variable
    
    var items: [descriptionItem] = descriptionItem.getMOC()
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        //  hide the nav bar when the user scrolls
        
        
        navigationController?.hidesBarsOnSwipe = true

        tableView.separatorStyle = .None
    }

}

extension TableViewController: UITableViewDataSource {
    
    
    //  create labels within the storyboard and call them within the cell row condition to fill the cells up with the arrays content
    
    
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
    
    
    //set the number of sections in the table view controller
    
    
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
    
    
    
    // set a condition that if a cell is selected then it updates and expands
    
    
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
    
    //  set the height of each cell as automatic according to the content within it, when the cell is selected then it will expand?
    
    
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


