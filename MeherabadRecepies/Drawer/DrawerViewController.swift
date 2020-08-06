//
//  DrawerViewController.swift
//  MeherabadRecepies
//
//  Created by Apurva Dongre on 06/08/20.
//  Copyright © 2020 Meherabad Recepies. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
        self.navigationController?.navigationBar.isHidden = true
        print("In Drawer")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

}

