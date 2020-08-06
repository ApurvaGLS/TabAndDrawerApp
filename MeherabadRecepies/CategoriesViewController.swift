//
//  CategoriesViewController.swift
//  MeherabadRecepies
//
//  Created by Apurva Dongre on 06/08/20.
//  Copyright © 2020 Meherabad Recepies. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    var barButtonItem: UIBarButtonItem!
    var Drawer: KYDrawerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        Drawer = self.navigationController?.parent as? KYDrawerController
        Drawer?.screenEdgePanGestureEnabled = true
        
        setupNavigationBar()
        addLeftMenuButton()
     }
    
    func setupNavigationBar() {
       self.navigationController?.navigationBar.isHidden = false
       self.navigationController?.navigationBar.topItem?.title = "Categories"
       self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
       self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white];
       self.navigationController?.navigationBar.tintColor = UIColor.white
       self.navigationController?.navigationBar.barTintColor = UIColor.red
       self.navigationController?.navigationBar.isTranslucent = false
       self.extendedLayoutIncludesOpaqueBars = true
       self.edgesForExtendedLayout = []
       self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
     }
    
    func addLeftMenuButton() {
        let menuBtn = UIButton(type: .custom)
        menuBtn.setImage(UIImage(named: "Menu"), for: .normal)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        menuBtn.addTarget(self, action: #selector(self.menuButtonPressed), for: .touchUpInside)
        barButtonItem = UIBarButtonItem(customView: menuBtn)
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = barButtonItem
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = UIColor.clear
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.isEnabled = false
    }
    
    @objc func menuButtonPressed() {
        Drawer?.setDrawerState(.opened, animated: true)
    }
}
