//
//  DrawerViewController.swift
//  MeherabadRecepies
//
//  Created by Apurva Dongre on 06/08/20.
//  Copyright © 2020 Meherabad Recepies. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {
    
    var Drawer: KYDrawerController?
    var menuArray : [[String:Any]]!
    @IBOutlet weak var menuTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuArray = [[String:Any]]()
        Drawer = self.navigationController?.parent as? KYDrawerController
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
        self.navigationController?.navigationBar.isHidden = true
        
        configureMenuItem()
        registercell()
    }
    
    func registercell(){
        menuTable.register(UINib(nibName: "DrawerMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        menuTable.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
    }
    
    func configureMenuItem(){
        let filepath = Bundle.main.path(forResource: "menu", ofType: "json")
        let data = FileManager.default.contents(atPath: filepath!)
        let jsonDict : [[String: Any]] = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [[String : Any]]
        for obj in jsonDict{
            menuArray.append(obj)
        }
    }
}


extension DrawerViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTable.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! DrawerMenuTableViewCell
        cell.menuName.text = menuArray[indexPath.row]["menu_name"] as? String
        cell.menuImage.image = UIImage(named: menuArray[indexPath.row]["menu_image"] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Type = menuArray[indexPath.row]["type"] as! String
        if(Type == "storyboard"){
            if #available(iOS 13.0, *) {
                let aboutController : UIViewController = UIStoryboard.init(name: "Main", bundle: .main).instantiateViewController(identifier: menuArray[indexPath.row]["controller_name"] as! String)
                let navController = UINavigationController.init(rootViewController: aboutController)
                Drawer?.mainViewController = navController
                Drawer?.setDrawerState(.closed, animated: true)
            } else {
                // Fallback on earlier versions
            }
        }else{
          Drawer?.setDrawerState(.closed, animated: true)
          let s : Selector = NSSelectorFromString(menuArray[indexPath.row]["controller_name"] as! String)
          perform(s)
        }
    }
    
    @objc func SetShareApp(){
        print("Tap on Share")
    }
}

