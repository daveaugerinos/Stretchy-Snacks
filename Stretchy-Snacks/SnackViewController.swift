//
//  SnackViewController.swift
//  Stretchy-Snacks
//
//  Created by Dave Augerinos on 2017-03-16.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

class SnackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
    private var navBarTitleYCenterUP: NSLayoutConstraint!
    private var navBarTitleYCenterDOWN: NSLayoutConstraint!
    private var navBarTitleLabel = UILabel()
    private var stackView: UIStackView!
    private var margins = UILayoutGuide()
    private var isExpanded = false
    private var rotationAngle = M_PI_4
    private var currentText = String()
    private var tapGestureImageView1 = UITapGestureRecognizer()
    private var tapGestureImageView2 = UITapGestureRecognizer()
    private var tapGestureImageView3 = UITapGestureRecognizer()
    private var tapGestureImageView4 = UITapGestureRecognizer()
    private var tapGestureImageView5 = UITapGestureRecognizer()
    private let snackTableView = UITableView()
    
    var snackArray = [SnackItem]()
    
    private let kTableHeaderHeight:CGFloat = 200
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        // Nav Bar
        var colour: UIColor
        colour = UIColor.init(hex: "#FFDDDDDD")
        navBarView.backgroundColor = colour
        view.addSubview(navBarView)
        
        // Nav Title Bar
        navBarTitleLabel = UILabel(frame: CGRect.zero)
        navBarTitleLabel.center = navBarView.center
        navBarTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        navBarTitleLabel.textColor = .black
        navBarTitleLabel.textAlignment = .center
        navBarTitleLabel.text = "Snacks"
        navBarTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarTitleLabel)

        // Nav Title Bar constraints
        navBarTitleLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        navBarTitleYCenterUP = navBarTitleLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor)
        navBarTitleYCenterUP.isActive = true
        navBarTitleYCenterDOWN = navBarTitleLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor, constant: -40)
        
        margins = navBarView.layoutMarginsGuide
        
        // Add Button
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addButton.setTitle("＋", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.setTitleColor(.darkGray, for: .highlighted)
        addButton.addTarget(self, action: #selector(addButtonTapped(sender:)), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        // Add Button constraints
        addButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -3).isActive = true
        
        // Table View
        snackTableView.dataSource = self
        snackTableView.estimatedRowHeight = 25
        snackTableView.rowHeight = UITableViewAutomaticDimension
        snackTableView.register(UINib(nibName: "SnackTableViewCell", bundle: nil), forCellReuseIdentifier: "snackCell")
        
        // Table View constraints
        view.addSubview(snackTableView)
        snackTableView.translatesAutoresizingMaskIntoConstraints = false
        snackTableView.topAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
        snackTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        snackTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        snackTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // Images and constraints
        let imageView1 = UIImageView()
        imageView1.image = UIImage(named: "oreos")
        imageView1.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView1.isUserInteractionEnabled = true
        
        let imageView2 = UIImageView()
        imageView2.image = UIImage(named: "pizza_pockets")
        imageView2.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView2.isUserInteractionEnabled = true
        
        let imageView3 = UIImageView()
        imageView3.image = UIImage(named: "pop_tarts")
        imageView3.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView3.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView3.isUserInteractionEnabled = true
        
        let imageView4 = UIImageView()
        imageView4.image = UIImage(named: "popsicle")
        imageView4.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView4.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView4.isUserInteractionEnabled = true
        
        let imageView5 = UIImageView()
        imageView5.image = UIImage(named: "ramen")
        imageView5.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView5.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView5.isUserInteractionEnabled = true
        
        // Stack View
        stackView = UIStackView()
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.distribution = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.spacing = 16.0
        
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        stackView.addArrangedSubview(imageView3)
        stackView.addArrangedSubview(imageView4)
        stackView.addArrangedSubview(imageView5)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.isUserInteractionEnabled = true
        view.addSubview(stackView)
        stackView.isHidden = true
        
        // Stack View Constraints
        stackView.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: -10).isActive = true
        
        // Tap Gesture
        tapGestureImageView1 = UITapGestureRecognizer(target: self, action: #selector(tapSubView(sender:)))
        imageView1.addGestureRecognizer(tapGestureImageView1)
        
        tapGestureImageView2 = UITapGestureRecognizer(target: self, action: #selector(tapSubView(sender:)))
        imageView2.addGestureRecognizer(tapGestureImageView2)
        
        tapGestureImageView3 = UITapGestureRecognizer(target: self, action: #selector(tapSubView(sender:)))
        imageView3.addGestureRecognizer(tapGestureImageView3)
        
        tapGestureImageView4 = UITapGestureRecognizer(target: self, action: #selector(tapSubView(sender:)))
        imageView4.addGestureRecognizer(tapGestureImageView4)
        
        tapGestureImageView5 = UITapGestureRecognizer(target: self, action: #selector(tapSubView(sender:)))
        imageView5.addGestureRecognizer(tapGestureImageView5)
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return snackArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Set Identifier
        let cellIdentifier = "snackCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SnackTableViewCell else {
            fatalError("The dequeued cell is not an instance of SnackTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let snackItem = snackArray[indexPath.row]
        
        // Configure the cell
        cell.configureSnackCell(with: snackItem)
        
        return cell
    }
    
    // MARK: - Action Methods
    
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
                
                self.stackView.isHidden = !self.stackView.isHidden
                
            }, completion: nil)
        })
        
        UIView.animate(withDuration: 1.0, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseIn, animations: { () -> Void in
            
            sender.transform = CGAffineTransform(rotationAngle: CGFloat(self.rotationAngle))
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func tapSubView(sender: UITapGestureRecognizer) {
        
        var snack: SnackItem
        
        switch sender {
        case tapGestureImageView1:
           snack = SnackItem(snack: .oreos)
        case tapGestureImageView2:
            snack = SnackItem(snack: .pizzaPockets)
        case tapGestureImageView3:
            snack = SnackItem(snack: .popTarts)
        case tapGestureImageView4:
            snack = SnackItem(snack: .popscile)
        case tapGestureImageView5:
            snack = SnackItem(snack: .ramen)
        default:
            snack = SnackItem(snack: .oreos)
        }
        
        snackArray.insert(snack, at: 0)
        snackTableView.reloadData()
    }
}
