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

    @IBOutlet weak var popup: UIView!
    
    @IBOutlet weak var popupDetail: UILabel!
    
    @IBOutlet weak var ratImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var ratLabel: UILabel!
    @IBOutlet weak var speechBubble: UIImageView!
      @IBOutlet weak var speechButton: UIButton!
    
    @IBAction func closeButton(sender: AnyObject) {
        popup.hidden = true
        ratImage.hidden = true
        popupDetail.hidden = true
    }
    
    @IBAction func speechButton(sender: AnyObject) {
        speechBubble.hidden = true
        ratLabel.hidden = true
        speechButton.hidden = true
    }
    
    @IBAction func ratButton(sender: AnyObject) {
        ratLabel.hidden = false
        speechButton.hidden = false
        speechBubble.hidden = false
        currentFactIndex = (currentFactIndex+1)%facts.count
        updateText()
    }
    
  
    @IBOutlet weak var tableView: UITableView!
    
    //  call array of content from description app file and then call it here as a variable
    
    var facts = [
        "Banging your head against a wall uses 150 calories an hour",
        "An ostrich’s eye is bigger than its brain",
        "The average lead pencil will draw a line 35 miles long",
        "A piece of paper can be folded no more then 9 times",
        "The king of hearts is the only king without a moustache",
        "Every year about 98% of the atoms in your body are replaced",
        "Cats can hear ultrasound",
        "1 in 5,000 north Atlantic lobsters are born bright blue",
        "1/3 of all tap water used for drinking in the USA is used to brew coffee",
        "Cats sleep 16 to 18 hours per day"
    ]
      var currentFactIndex = 0

    
    var items: [descriptionItem] = descriptionItem.getMOC()
    
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        popupDetail.text = "Hi, \n \n I am the rat found in the Skull of Sir William Longspee, here to help and provide some interesting facts. \n \n To navigate the timeline scroll up or down and tap the date for more information."
        popupDetail.adjustsFontSizeToFitWidth = true

        
        //  hide the nav bar when the user scrolls
        
        
        navigationController?.hidesBarsOnSwipe = true

        tableView.separatorStyle = .None
    }
    
    func updateText() {
        
        // Run animation that fades the label out, updates the text then fades it back in
        UIView.animateKeyframesWithDuration(0.25, delay: 0, options: nil, animations: {
            
            // Make the label invsible
            self.ratLabel.alpha = 0
            }, completion: { _ in
                // When the first animation completes then..
                
                // Update the labels text to be the next fact
                self.ratLabel.text = self.facts[self.currentFactIndex]
                
                // Run Animation to show label
                UIView.animateKeyframesWithDuration(0.25, delay: 0, options: nil, animations: {
                    self.ratLabel.alpha = 1 // Make the label visible again
                    }, completion: nil)
        })
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
            cell.ImageView.clipsToBounds = true
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
                return 500
            } else {
                return 150.0
            }
        default:
            return 0
        }
    }
    
}


// create a new class of the prototype cell and link the labels


class SecondCell: UITableViewCell {
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
}


