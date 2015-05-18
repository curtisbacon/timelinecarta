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
    
    @IBOutlet weak var ratFactBackground: UIView!
    @IBOutlet weak var ratImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var ratLabel: UILabel!
    @IBOutlet weak var speechBubble: UIImageView!
      @IBOutlet weak var speechButton: UIButton!
    
    @IBAction func closeButton(sender: AnyObject) {
        popup.hidden = true
        ratImage.hidden = true
        popupDetail.hidden = true
        ratFactBackground.hidden = true
    }
    
    @IBAction func speechButton(sender: AnyObject) {
        speechBubble.hidden = true
        ratLabel.hidden = true
        speechButton.hidden = true
        ratFactBackground.hidden = true
    }
    
    @IBAction func ratButton(sender: AnyObject) {
        ratLabel.hidden = false
        ratFactBackground.hidden = false
        speechButton.hidden = false
        speechBubble.hidden = false
        currentFactIndex = (currentFactIndex+1)%facts.count
        updateText()
    }
    
  
    @IBOutlet weak var tableView: UITableView!
    
    //  call array of content from description app file and then call it here as a variable
    
    var facts = [
        "Four of the Magna Carta’s original clauses are still part of British law",
        "The Magna Carta was valid for just 10 weeks",
        "Salisbury cathedral has the oldest working clock in the world",
        "Salisbury's clock is made of hand-wrought iron",
        "When Longespee's tomb was opened in the 18th century, a mummified rat was found inside his skull",
        "King John is often portrayed as the villain in the story of Robin Hood",
        "The council of 25 barons that the Magna Carta formed eventually became the Parliament of England",
        "A clause in the Magna Carta was the Barons had the right to watch over the King and seize his castle if he was to break his word",
        "Before the Magna Carta was signed widows and daughters of Barons could be sold by the king for money",
        "Despite signing the Magna Carta, King John continued doing as he pleased. This led to the Barons war between 1215-1217",
        "Freedom of speech might not have been possible if the Magna Carta had not been signed",
        "The Magna Carta was never actually signed but instead authenticated by the Royal Seal",
        "There is not evidence to suggest King John could even write",
        "Before the Magna Carta, the term Free people only referred to 25% of the population",
        "The Magna Carta is made of pig skin and ducks beak",
        "Salisbury Cathedral is home to the largest and oldest complete set of choir stalls in the country",
        "The Cathedral's central sprire is the tallest in England it rises 404 feet tall and weighs 6400 tons.",
        "The sprire's full climb is 332 steps",
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
            cell.headingLabel.adjustsFontSizeToFitWidth = true
            cell.ImageView.image = UIImage(named: item.filename)
            return cell
        default:
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            return cell
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.05,0.05,1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
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
       
        case 1:
            let item = items[indexPath.row]
            if item.selected {
                if item.filename == "-" {
                    return 350
                } else {
                    return 500
                }
            
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


