//
//  SwiftFireworks.swift
//  SwiftFireworks
//
//  Created by Enric Macias Lopez on 2017/07/28.
//  Copyright © 2017 Enric Macias Lopez. All rights reserved.
//

import UIKit

public class SwiftFireworks: NSObject, CAAnimationDelegate {
    
    //------------------------------------------------------------------------------
    // MARK: - Properties -
    //------------------------------------------------------------------------------
    
    public static let sharedInstance = SwiftFireworks()
    
    private var fireworksDic: [String:CAShapeLayer] = [:]
    
    //------------------------------------------------------------------------------
    // MARK: - Public methods -
    //------------------------------------------------------------------------------
    
    /*
     * @discussion Shows a firework on the view and position given
     * @param view View where the firework must be shown
     * @param position Firework position inside the given view
     * @param radius Firework radius in scree units
     * @param sparkLength Firework sparks length in screen units
     * @param sparkThickness Firework sparks thickness in screen units
     * @param sparkSeparation Firework sparks separation in screen units
     * @param color Firework color
     */
    public func showFirework(inView view:UIView, andPosition position:CGPoint, radius:CGFloat? = nil, sparkLength:CGFloat? = nil, sparkThickness:CGFloat? = nil, sparkSeparation:CGFloat? = nil, color:UIColor? = nil) {
        
        // If there are nil parameters, random values are assigned by default
        let radius = radius ?? randomCGFloat(min: 50.0, max: 180.0)
        let sparkLength = sparkLength ?? randomCGFloat(min: 5.0, max: 20.0)
        let sparkThickness = sparkThickness ?? randomCGFloat(min: 1, max: 6)
        let sparkSeparation = sparkSeparation ?? randomCGFloat(min: 20, max: 50)
        let color = color ?? randomColor()
        
        // Create firework
        let firework: CAShapeLayer = CAShapeLayer()
        firework.frame = CGRect(x: position.x - radius, y: position.y - radius, width: radius*2, height: radius*2)
        firework.lineWidth = sparkLength
        firework.strokeColor = color.cgColor
        firework.fillColor = UIColor.clear.cgColor
        //firework = UIColor.brown.cgColor
        firework.lineDashPattern = [sparkThickness, sparkSeparation] as [NSNumber]
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius),
                                      radius: radius,
                                      startAngle: CGFloat(0.0),
                                      endAngle: CGFloat(Double.pi*2),
                                      clockwise: false)
        
        firework.path = circlePath.cgPath
        firework.mask = mask(radius: radius)
        
        view.layer.addSublayer(firework)
        
        animate(firework: firework)
    }
    
    /*
     * @discussion Shows a set of fireworks on the view and position given
     * @param view View where the firework must be shown
     * @param position Firework position inside the given view
     * @param num Number of fireworks to be shown
     * @param color Firework color
     */
    public func showFireworkSet(inView view:UIView, andPosition position:CGPoint, numberOfFireworks num:UInt? = nil) {
        var num = num ?? 5
        num = (num == 0) ? 1 : num
        
        for _ in 1...num {
            showFirework(inView: view,
                         andPosition: position)
        }
    }
    
    //------------------------------------------------------------------------------
    // MARK: - Private methods -
    //------------------------------------------------------------------------------
    
    private func mask(radius:CGFloat) -> CAShapeLayer {
        let mask: CAShapeLayer = CAShapeLayer()
        mask.frame = CGRect(x: 0, y: 0, width: radius*2, height: radius*2)
        
        let arcCenter = CGPoint(x: radius, y: radius)
        let startAngle = CGFloat(0.0)
        let endAngle = CGFloat(Double.pi*2)
        
        let donutPath = CGMutablePath()
        donutPath.addArc(center: arcCenter,
                         radius: radius + radius*0.25,
                         startAngle: startAngle,
                         endAngle: endAngle,
                         clockwise: false)
        donutPath.addArc(center: arcCenter,
                         radius: radius*0.75,
                         startAngle: startAngle,
                         endAngle: endAngle,
                         clockwise: false)
        
        mask.path = donutPath
        mask.fillRule = CAShapeLayerFillRule.evenOdd
        
        return mask
    }
    
    private func animate(firework:CAShapeLayer) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.5
        animation.fromValue = 0.001
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        firework.add(animation, forKey: "boom")
        
        let maskAnimation = CABasicAnimation(keyPath: "transform.scale")
        maskAnimation.duration = 2.0
        maskAnimation.fromValue = 1.0
        maskAnimation.toValue = 2.0
        maskAnimation.fillMode = CAMediaTimingFillMode.forwards
        maskAnimation.isRemovedOnCompletion = false
        maskAnimation.delegate = self
        maskAnimation.setValue(firework.description, forKey: "vanish")
        
        // Tracking fireworks to remove them from the superlayer when animation finishes
        fireworksDic[firework.description] = firework
        
        firework.mask?.add(maskAnimation, forKey: "vanish")
    }
    
    //------------------------------------------------------------------------------
    // MARK: - Helpers -
    //------------------------------------------------------------------------------
    
    public func randomCGFloat(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (max - min) + min
    }
    
    public func randomInt(min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
    
    public func randomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    //------------------------------------------------------------------------------
    // MARK: - CAAnimationDelegate -
    //------------------------------------------------------------------------------
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let firework = fireworksDic[anim.value(forKey: "vanish") as! String]
        firework?.removeFromSuperlayer()
    }
}

