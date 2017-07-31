//
//  ViewController.swift
//  Fireworks
//
//  Created by enric_maciaslopez on 07/28/2017.
//  Copyright (c) 2017 enric_maciaslopez. All rights reserved.
//

import UIKit
import SwiftFireworks

class SkyViewController: UIViewController {

    //------------------------------------------------------------------------------
    // MARK: - Properties -
    //------------------------------------------------------------------------------
    
    // MARK: - IBOutlets
    @IBOutlet var fireworkButton: UIButton!
    @IBOutlet var fireworkSetButton: UIButton!
    
    
    //------------------------------------------------------------------------------
    // MARK: - Lifecycle -
    //------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
    }
    
    //------------------------------------------------------------------------------
    // MARK: - Actions -
    //------------------------------------------------------------------------------
    
    @IBAction func didPressFirework() {
        let screenBounds = UIScreen.main.bounds
        
        let leftBounds: CGFloat = screenBounds.origin.x + 20
        let rightBounds: CGFloat = screenBounds.origin.x + screenBounds.size.width - 20.0
        let topBounds: CGFloat = screenBounds.origin.y + 20.0
        let bottomBounds: CGFloat = screenBounds.origin.y + screenBounds.size.height - 20.0
        let posX: CGFloat = SwiftFireworks.sharedInstance.randomCGFloat(min: leftBounds, max: rightBounds)
        let posY: CGFloat = SwiftFireworks.sharedInstance.randomCGFloat(min: topBounds, max: bottomBounds)
        
        SwiftFireworks.sharedInstance.showFirework(inView: view,
                                                   andPosition: CGPoint(x: posX, y: posY))
    }
    
    @IBAction func didPressFireworkSetButton() {
        let screenBounds = UIScreen.main.bounds
        
        let leftBounds: CGFloat = screenBounds.origin.x + 20
        let rightBounds: CGFloat = screenBounds.origin.x + screenBounds.size.width - 20.0
        let topBounds: CGFloat = screenBounds.origin.y + 20.0
        let bottomBounds: CGFloat = screenBounds.origin.y + screenBounds.size.height - 20.0
        let posX = SwiftFireworks.sharedInstance.randomCGFloat(min: leftBounds, max: rightBounds)
        let posY = SwiftFireworks.sharedInstance.randomCGFloat(min: topBounds, max: bottomBounds)
        
        SwiftFireworks.sharedInstance.showFireworkSet(inView: view,
                                                      andPosition: CGPoint(x: posX, y: posY),
                                                      numberOfFireworks: 6)
    }

}

