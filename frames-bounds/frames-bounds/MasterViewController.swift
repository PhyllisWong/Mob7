//
//  ViewController.swift
//  frames-bounds
//
//  Created by Phyllis Wong on 5/2/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let containerRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        let cv = UIView(frame: containerRect)
        cv.backgroundColor = .white
        return cv
    }()
    
    func setupContainerView() {
        self.view.addSubview(containerView)
    }
    
    // Segmented control to display other view controllers
    lazy var navSegmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["red", "checker", "rainbow"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.black
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    func setupSegementedControl() {
        // Get the height of the screen
        let screenHeight = UIScreen.main.bounds.height
        self.view.addSubview(navSegmentControl)
        navSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        navSegmentControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: screenHeight / 2.5).isActive = true
        
        navSegmentControl.addTarget(self, action: #selector(madeSelection), for: .valueChanged)
    }
    
    @objc func madeSelection(_ sender: UISegmentedControl) {
        redVC.view.isHidden = sender.selectedSegmentIndex == 1 || sender.selectedSegmentIndex == 2
        checkerVC.view.isHidden = sender.selectedSegmentIndex == 0 || sender.selectedSegmentIndex == 2
        rainbowVC.view.isHidden = sender.selectedSegmentIndex == 0 || sender.selectedSegmentIndex == 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerView()
        setupSegementedControl()
        redVC.view.isHidden = false
    }

    func addAsChildVC(childVC: UIViewController) {
        addChildViewController(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.frame
        childVC.didMove(toParentViewController: self)
    }
    
    lazy var redVC: RedViewController = {
        let vc = RedViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    lazy var checkerVC: CheckerViewController = {
        let vc = CheckerViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    lazy var rainbowVC: RainbowViewController = {
        let vc = RainbowViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
}















