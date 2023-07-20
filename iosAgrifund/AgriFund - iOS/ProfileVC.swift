//
//  ProfileVC.swift
//  AgriFund - iOS
//
//  Created by DA MAC M1 117 on 2023/07/20.
//

import UIKit



class ProfileVC: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtContactNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        txtName.layer.cornerRadius = 25.0
        txtName.layer.borderWidth = 1.0
        txtName.layer.masksToBounds = true
        txtName.layer.borderColor = UIColor.lightGray.cgColor
        
        txtSurname.layer.cornerRadius = 25.0
        txtSurname.layer.borderWidth = 1.0
        txtSurname.layer.masksToBounds = true
        txtSurname.layer.borderColor = UIColor.lightGray.cgColor
        
        txtID.layer.cornerRadius = 25.0
        txtID.layer.borderWidth = 1.0
        txtID.layer.masksToBounds = true
        txtID.layer.borderColor = UIColor.lightGray.cgColor
        
        txtContactNumber.layer.cornerRadius = 25.0
        txtContactNumber.layer.borderWidth = 1.0
        txtContactNumber.layer.masksToBounds = true
        txtContactNumber.layer.borderColor = UIColor.lightGray.cgColor
      

        
    
    }
    
}
