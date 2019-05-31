//
//  CustomViewController.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 26/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    @IBOutlet weak var customView: CustomView!
    
    override func viewDidAppear(_ animated: Bool) {
        customView.layer.borderColor = UIColor.blue.cgColor
        customView.layer.borderWidth = 3
        
        customView.layer.cornerRadius = customView.cornerRadius
        customView.layer.masksToBounds = true
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 0.4
        customView.layer.shadowRadius = 15
        customView.layer.shadowOffset = .zero
        
        UIView.animate(withDuration: 3) {
            let translationAndRotation = CGAffineTransform(translationX: -50, y: -100).concatenating(CGAffineTransform(rotationAngle: .pi)).concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
            
            self.customView.transform = translationAndRotation
        }
    }
}

class CustomView: UIView {
@IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        context.setFillColor(UIColor.blue.cgColor)
        context.fill(CGRect(x: 75, y: 75, width: 50, height: 50))
        let star = UIBezierPath()
//        context.setStrokeColor(UIColor.red.cgColor)
        UIColor.black.setStroke()
        star.move(to: CGPoint(x: 40, y: 20))
        star.addLine(to: CGPoint(x: 45, y: 40))
        star.addLine(to: CGPoint(x: 65, y: 40))
        star.addLine(to: CGPoint(x: 50, y: 50))
        star.addLine(to: CGPoint(x: 60, y: 70))
        star.addLine(to: CGPoint(x: 40, y: 55))
        star.addLine(to: CGPoint(x: 20, y: 70))
        star.addLine(to: CGPoint(x: 30, y: 50))
        star.addLine(to: CGPoint(x: 15, y: 40))
        star.addLine(to: CGPoint(x: 35, y: 40))
        star.close()
        star.stroke()
        UIColor.red.setFill()
        star.fill()
//        context.strokePath()

    }
    
}
