//
//  RegisterVC.swift
//  AgriFund - iOS
//
//  Created by DA MAC M1 163 on 2023/07/20.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var backgroundview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundview.roundCorners([.topLeft,.topRight], radius: 50)
            }

        }
extension UIView{
    func roundCorners(_ corners: UIRectCorner,radius: CGFloat) {
        if #available(iOS 11, *) {
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
        }
        else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize (width: radius , height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
