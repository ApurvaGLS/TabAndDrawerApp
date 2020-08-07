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
        cell.menuName.text = "menu"
        return cell
    }
}

