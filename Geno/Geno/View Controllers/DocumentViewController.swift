//
//  ViewController.swift
//  Geno
//
//  Created by Rodney Dyer on 6/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import MapKit


class DocumentViewController: NSViewController {
    
    private let coreDataManager = CoreDataManager(modelName: "DataSet")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        print("\(coreDataManager.managedObjectContext)")
        
        let ind = Individual(context: coreDataManager.managedObjectContext )
        ind.id = 21
        
        do {
            try coreDataManager.managedObjectContext.save()
        } catch {
            print("\(error), \(error.localizedDescription)")
        }
        print(ind)
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func ImportData(sender: Any) {
        print("Import Data Called")
    }
    
}

