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
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    private var isExpanded = false
    private var rotationAngle = M_PI_4
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        var colour: UIColor
        colour = UIColor.init(hex: "#FFDDDDDD")
        navBarView.backgroundColor = colour
        
        view.addSubview(navBarView)
        
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addButton.setTitle("＋", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.setTitleColor(.darkGray, for: .highlighted)
        addButton.addTarget(self, action: #selector(addButtonTapped(sender:)), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        let margins = navBarView.layoutMarginsGuide
        addButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -3).isActive = true
    }
    
    func addButtonTapped(sender: UIButton) {
        
        if(isExpanded) {
        
            navBarHeightConstraint.constant = 66
            rotationAngle = 0
            isExpanded = false
        }
        
        else {
            
            navBarHeightConstraint.constant = 200
            rotationAngle = M_PI_4
            isExpanded = true
        }
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            
            sender.transform = CGAffineTransform(rotationAngle: CGFloat(self.rotationAngle))
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.25, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
}
