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
        
        SwiftFireworks.sharedInstance.showFirework(inView: view,
                                                   andPosition: CGPoint(x: screenBounds.width/2, y: screenBounds.height/2),
                                                   radius: 100.0,
                                                   sparkLength: 9.0,
                                                   sparkThickness: 4.0,
                                                   sparkSeparation: 20.0,
                                                   color: UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0))
    }
    
    @IBAction func didPressRandomFirework() {
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
        let posX: CGFloat = SwiftFireworks.sharedInstance.randomCGFloat(min: leftBounds, max: rightBounds)
        let posY: CGFloat = SwiftFireworks.sharedInstance.randomCGFloat(min: topBounds, max: bottomBounds)
        
        SwiftFireworks.sharedInstance.showFirework(inView: view,
                                                   andPosition: CGPoint(x: posX, y: posY),
                                                   radius: 120.0,
                                                   sparkLength: 12.0,
                                                   sparkThickness: 2.0,
                                                   sparkSeparation: 15.0,
                                                   color:UIColor(red: 255.0/255.0, green: 193.0/255.0, blue: 7.0/255.0, alpha: 1.0))
        SwiftFireworks.sharedInstance.showFirework(inView: view,
                                                   andPosition: CGPoint(x: posX, y: posY),
                                                   radius: 90.0,
                                                   sparkLength: 9.0,
                                                   sparkThickness: 4.0,
                                                   sparkSeparation: 26.0,
                                                   color:UIColor(red: 255.0/255.0, green: 245.0/255.0, blue: 157.0/255.0, alpha: 1.0))
        SwiftFireworks.sharedInstance.showFirework(inView: view,
                                                   andPosition: CGPoint(x: posX, y: posY),
                                                   radius: 80.0,
                                                   sparkLength: 10.0,
                                                   sparkThickness: 3.0,
                                                   sparkSeparation: 20.0,
                                                   color:UIColor(red: 179.0/255.0, green: 229.0/255.0, blue: 252.0/255.0, alpha: 1.0))
        SwiftFireworks.sharedInstance.showFirework(inView: view,
                                                   andPosition: CGPoint(x: posX, y: posY),
                                                   radius: 75.0,
                                                   sparkLength: 15.0,
                                                   sparkThickness: 3.0,
                                                   sparkSeparation: 13.0,
                                                   color:UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 128.0/255.0, alpha: 1.0))
        SwiftFireworks.sharedInstance.showFirework(inView: view,
                                                   andPosition: CGPoint(x: posX, y: posY),
                                                   radius: 50.0,
                                                   sparkLength: 5.0,
                                                   sparkThickness: 4.0,
                                                   sparkSeparation: 18.0,
                                                   color:UIColor(red: 61.0/255.0, green: 196.0/255.0, blue: 157.0/255.0, alpha: 1.0))
    }
    
    @IBAction func didPressRandomFireworkSetButton() {
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

