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
        arr.append(descriptionItem(date: "1119", name: "Taxes, taxes, taxes...", filename: "taxes", title: "King John comes to the throne. His reign is characterised as being corrupt and despotic. His treasury becomes very wealthy."))
        arr.append(descriptionItem(date: "1204", name:"John ‘Softsword", filename: "taxes", title: "A series of military defeats lead to John losing a lot of his territory in France. He receives an unfortunate nickname."))
        arr.append(descriptionItem(date: "1213", name:"Royal Submission", filename: "taxes", title: "The king finally submits to the pope, accepting him as overlord. He agrees to pay the pope 1000 marks a year to rule England!"))
        arr.append(descriptionItem(date: "1180", name:"King John", filename: "taxes", title: "wjesh fhbds hjdsb hjsb chgvsd cghv hjgdsvc jgwdvcgwv cjvwtcv dthwvwvc jwdgcv dhjwgv cjgdwvgjv wjghdv cdvwjcgv jwdhgvc kjsdvc jsd vcjk ehf whf lkwb flk bwhlfbhjsbdfhjbs hfb ehjksbf kwjbfjhkbd fkbdbf dwbfhwdb  f dlkbf ldhkbsclk bdwlk"))
        arr.append(descriptionItem(date: "1183", name:"King John", filename: "taxes", title: "wehf whf lkwb flk jghszvdc vdjh dvghjcjsv cjksvjkc bkvcbjkabvjkwkjscvksv cjsvkjchbalwf abkcbweybc waiyb cuyibewc biabeckjhaw ckhjbashjvckjg avdsjgk cvjgh hfb ehjksbf kwjbfjhkbd fkbdbf dwbfhwdb  f dlkbf ldhkbsclk bdwlk"))
        return arr
    }
}
