//
//  DescriptionItem.swift
//  timelinecarta
//
//  Created by Curtis Bacon on 29/04/2015.
//  Copyright (c) 2015 Curtis Bacon. All rights reserved.
//

import UIKit


//create an array of content that wil fill the table view cells

class descriptionItem: NSObject {
    var date: String = ""
    var title: String = ""
    var name: String = ""
    var filename: String = ""
    var selected: Bool = false

    
    init(date :String, name: String, filename: String, title: String) {
        super.init()
        self.date = date
        self.title = title
        self.name = name
        self.filename = filename
    }
    
    class func getMOC() -> [descriptionItem] {
        var arr: [descriptionItem] = []
        arr.append(descriptionItem(date: "1119", name: "Taxes, taxes, taxes", filename: "199Taxes.jpg", title: "King John comes to the throne. His reign is characterised as being corrupt and despotic. His treasury becomes very wealthy."))
        
        arr.append(descriptionItem(date: "1204", name: "John ‘Softsword’", filename: "1204Softsword.jpg", title: "A series of military defeats lead to John losing a lot of his territory in France. He is given an unfortunate nickname."))
        
        //No Image
        arr.append(descriptionItem(date: "1200’s", name: "More Taxes’", filename: "-", title: "Less land means less money…. the solution: more taxes."))
        
        arr.append(descriptionItem(date: "1208-09", name: "On the Wrong Side of The Church", filename: "1208-09Pope.jpg", title: "King John interferes with church. As a result, the pope excommunicates him and punishes England by suspending most church activities."))
        
        //No Image
        arr.append(descriptionItem(date: "1213", name: "Royal Submission", filename: "-", title: "The king finally submits to the pope, accepting him as overlord. \n He agrees to pay the pope 1000 marks a year to rule England!"))
        
        arr.append(descriptionItem(date: "1214 - 15", name: "Breaking Ties", filename: "1214-15London.jpg", title: "Following further military defeats in France, the king’s baron’s get fed up with him and rebel against his reign. They take London."))
        
        //No image
        arr.append(descriptionItem(date: "1215", name: "Making Demands", filename: "-", title: "The Archbishop of Canterbury mediates between the barons and the king. The barons come up with a wish list: The Articles of the Barons."))
        
        arr.append(descriptionItem(date: "15 June 1215", name: "The Signing", filename: "1215TheSigning.jpg", title: "The king is angry but has to agree. He has no choice. He concedes. Magna Carta is issued. "))
        
        arr.append(descriptionItem(date: "July 1215", name: "Spreading the Word", filename: "1215SpreadingTheWord.jpg", title: "The archbishop gets his steward to distribute Magna Carta around the kingdom. He’s a priest by the name of Elias de Dereham."))
        
        //No Image
        arr.append(descriptionItem(date: "1215", name: "Who Took It?", filename: "-", title: "A copy of Magna Carta is taken to old Sarum, Salisbury’s predecessor Cathedral. We’re not sure if  the earl of Salisbury, William Longespee who took it there, or Elias himself."))
        
        //No Image
        arr.append(descriptionItem(date: "1217", name: "Too Windy, No Water", filename: "-", title: "Permission is requested to move the Cathedral at Old Sarum to a new site. Complaints about the old site are that it is too windy drowning out the sounds of chanting and causing frequent colds. The Real Reason. The cathedral is tired of being controlled by the garrison surrounding them at Old Sarum. They dream of freedom and prosperity."))
        
        arr.append(descriptionItem(date: "1219", name: "“To Be Paid Without Quibbling or Fiddling”", filename: "1219”ToBePaid.jpg", title: "The Cathedral clergy meet and agree that all will give a large part of their income for seven years to help build the new cathedral. (They vote on behalf of those absent as well!)"))
        
        arr.append(descriptionItem(date: "Around 1219", name: "An Incomparable Artificer", filename: "1219Artificer.jpg", title: "Elias de Dereham, now renowned as a master project manager/builder is charged with leading the building of the new cathedral."))
        
        arr.append(descriptionItem(date: "Around 1220", name: "The Oder of The Day", filename: "1220Cathedral.jpg", title: "The official laying of the foundation stones. The first stone is laid for the pope, the second for the archbishop of Canterbury, the third by the bishop, the fourth by William, Earl of Salisbury, the fifth by his wife…. etc. "))
        
        arr.append(descriptionItem(date: "1226", name: "Death of an Earl", filename: "1226Death.jpg", title: "William Longespee, Earl of Salisbury, dies. He is the first person to be buried in the Cathedral. His tomb shows him as a knight in his finest hour. "))
        
        arr.append(descriptionItem(date: "Mid 1200’s", name: "Ammunition on Parchment", filename: "1200sPartchment.jpg", title: "Magna Carta is moved to the new cathedral with many other documents.  Because it guarantees the freedom of the Church, it is considered a muniment (defensive document). It is kept in the newly built fortified muniment room. "))
        
        arr.append(descriptionItem(date: "1246", name: "A Light Goes Out", filename: "1246ALightGoesOut.jpg", title: "Elias Dies"))
        
        arr.append(descriptionItem(date: "1258", name: "Completion Day", filename: "1258CompletionDay.jpg", title: "The Cathedral is completed. "))
        
        arr.append(descriptionItem(date: "1700's", name: "Mischief in The Library", filename: "1700sMischief.jpg", title: "The seal on Magna Carta disappears. Naughty choir boys have been catching mice in the pages of thick books in the library…. Or did a seal collector remove it?"))
        
        //No Image
        arr.append(descriptionItem(date: "1940", name: "Tucked Away", filename: "-", title: "Magna Carta is kept in a cave for safekeeping during the war. The cave is later used to grow mushrooms!"))
        
        arr.append(descriptionItem(date: "2015", name: "Anniversary ", filename: "2015Anniversary.png", title: "June 15th marks 800 years since the signing of the Magna Carta. "))
        return arr
    }
}
