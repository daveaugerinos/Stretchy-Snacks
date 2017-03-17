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
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        var colour: UIColor
        colour = UIColor.init(hex: "#FFDDDDDD")
        navBarView.backgroundColor = colour
        
        view.addSubview(navBarView)
        
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addButton.setTitle("＋", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped(sender:)), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        let margins = navBarView.layoutMarginsGuide
        addButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -3).isActive = true
    }
    
    func addButtonTapped(sender: UIButton) {
        
        
    }
}
