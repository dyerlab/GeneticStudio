//
//  ViewController.swift
//  Geno
//
//  Created by Rodney Dyer on 6/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import MapKit


class ViewController: NSViewController {
    
    private let coreDataManager = CoreDataManager(modelName: "DataSet")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("\(coreDataManager.managedObjectContext)")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

