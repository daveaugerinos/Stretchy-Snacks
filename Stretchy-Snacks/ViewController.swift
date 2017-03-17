//
//  ViewController.swift
//  Stretchy-Snacks
//
//  Created by Dave Augerinos on 2017-03-16.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navBarView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        var colour: UIColor
        colour = UIColor.init(hex: "#FFDDDDDD")
        navBarView.backgroundColor = colour
        
        view.addSubview(navBarView)
        
    }
}
