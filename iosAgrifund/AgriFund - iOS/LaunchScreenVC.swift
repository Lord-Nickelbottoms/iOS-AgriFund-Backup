//
//  LaunchScreenViewController.swift
//  AgriFund - iOS
//
//  Created by DA MAC M1 139 on 2023/07/20.
//

import UIKit

class LaunchScreenVC: UIViewController {

    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 150,
                                                  height: 150))
        imageView.image = UIImage(named: "f_carrot")
        return imageView
    }()
    
    var wordToAnimate = "Agri"
    
    private var wordLabel: UILabel = {
        var wordToAnimate = ""
        var wordLabel = UILabel(frame: CGRect(x: 95,
                                                  y: 390,
                                                  width: 250,
                                                  height: 50))
            
       
        wordLabel.text = wordToAnimate
        wordLabel.textColor = UIColor(hex: 0x5B0837)
        //wordLabel.textColor = UIColor.black // Set the text color
        wordLabel.font = UIFont.boldSystemFont(ofSize: 46)
        
        wordLabel.layer.shadowColor = UIColor.black.cgColor
        wordLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        wordLabel.layer.shadowOpacity = 0.5
        wordLabel.layer.shadowRadius = 4
        
        return wordLabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
