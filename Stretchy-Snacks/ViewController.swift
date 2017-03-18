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
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    private var navBarTitleYCenterUP: NSLayoutConstraint!
    private var navBarTitleYCenterDOWN: NSLayoutConstraint!
    private var navBarTitleLabel = UILabel()
    private var margins = UILayoutGuide()
    private var isExpanded = false
    private var rotationAngle = M_PI_4
    private var currentText = String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        var colour: UIColor
        colour = UIColor.init(hex: "#FFDDDDDD")
        navBarView.backgroundColor = colour
        view.addSubview(navBarView)
        
        navBarTitleLabel = UILabel(frame: CGRect.zero)
        navBarTitleLabel.center = navBarView.center
        navBarTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        navBarTitleLabel.textColor = .black
        navBarTitleLabel.textAlignment = .center
        navBarTitleLabel.text = "Snacks"
        navBarTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarTitleLabel)

        navBarTitleLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        navBarTitleYCenterUP = navBarTitleLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor)
        navBarTitleYCenterUP.isActive = true
        navBarTitleYCenterDOWN = navBarTitleLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor, constant: -40)
        
        margins = navBarView.layoutMarginsGuide
        
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addButton.setTitle("＋", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.setTitleColor(.darkGray, for: .highlighted)
        addButton.addTarget(self, action: #selector(addButtonTapped(sender:)), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        addButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -3).isActive = true
    }
    
    func addButtonTapped(sender: UIButton) {
        
        if(isExpanded) {
        
            navBarHeightConstraint.constant = 66
            rotationAngle = 0
            currentText = "Snacks"
            navBarTitleYCenterDOWN.isActive = false
            navBarTitleYCenterUP.isActive = true
            isExpanded = false
        }
        
        else {
            
            navBarHeightConstraint.constant = 200
            rotationAngle = M_PI_4
            currentText = "Add A Snack"
            navBarTitleYCenterUP.isActive = false
            navBarTitleYCenterDOWN.isActive = true
            isExpanded = true
        }
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseIn, animations: { () -> Void in
            
            self.navBarTitleLabel.alpha = 0
            
        }, completion: { (finished: Bool) -> () in
            
            self.navBarTitleLabel.text = self.currentText
            
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: { () -> Void in
                
                self.navBarTitleLabel.alpha = 1
                
            }, completion: nil)
        })
        
        UIView.animate(withDuration: 1.0, delay: 0.25, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
            
            sender.transform = CGAffineTransform(rotationAngle: CGFloat(self.rotationAngle))
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
}
