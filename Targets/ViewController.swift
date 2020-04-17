//
//  ViewController.swift
//  Targets
//
//  Created by Daniel Hjärtström on 2020-04-17.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let properties = UIApplication.fetchEnvironmentProperties()
        print(UIApplication.environment)
    }


}

