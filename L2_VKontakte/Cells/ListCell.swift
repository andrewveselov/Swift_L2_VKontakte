//
//  ListCell.swift
//  L2_VKontakte
//
//  Created by Andrew Veselov on 30/05/2019.
//  Copyright © 2019 Andrew Veselov. All rights reserved.
//

import UIKit

@IBDesignable class ListCell: UITableViewCell {
    
    static let reuseIdentifier = "ListCell"
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var likeButton: LikeButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.addTarget(self, action: #selector(likeButtonDidTapped), for: .valueChanged)
    }

    @objc func likeButtonDidTapped() {
        if likeButton.isLiked {
// TODO
        } else {
// TODO
        }
    }
/*
    func performSegue(withIdentifier identifier: String,
                      sender: Any?)
    {}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "like", sender: indexPath)
    }
*/
}
    
class LikeButton: UIControl {
    
    var isLiked: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let sideOne = rect.height * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
        
        let path = UIBezierPath()
        
        path.addArc(withCenter: CGPoint(x: rect.height * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        path.addArc(withCenter: CGPoint(x: rect.height * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        path.addLine(to: CGPoint(x: rect.height * 0.5, y: rect.height * 0.95))
        
        path.close()
        
        UIColor.red.setStroke()
        UIColor.red.setFill()
        
        isLiked ? path.fill() : path.stroke()
    }
    
    func setupView() {
        self.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        self.layer.cornerRadius = min(self.bounds.height, self.bounds.width) / 5
        clipsToBounds = true
    }
    
    @objc func changeState() {
        isLiked.toggle()
        self.sendActions(for: .valueChanged)
        setNeedsDisplay()
    }
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
