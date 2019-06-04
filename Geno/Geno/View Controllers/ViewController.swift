//
//  ViewController.swift
//  Geno
//
//  Created by Rodney Dyer on 6/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var coreDataManager = CoreDataManager(modelName: "DataSet")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

