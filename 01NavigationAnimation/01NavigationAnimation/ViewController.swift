//
//  ViewController.swift
//  01NavigationAnimation
//
//  Created by MacPro on 03/07/2018.
//  Copyright © 2018 Centaline. All rights reserved.
//

import UIKit

// 设置继承自 UITableViewController
class ViewController: UITableViewController {

    
    // MARK: - Types
    // 使用结构体包装 : 值传递时使用结构体实现, 引用传递时使用class
    struct Constants {
        struct Images {
            static let one = "one"
            static let two = "two"
            static let three = "three"
            static let four = "four"
            static let five = "five"
            static let six = "six"
        }
    }
    
    // MARK: - Properties
    // 定义使用的属性
    var entries = [
        Entry(title: "First Entry", image: UIImage(named: "one")!),
        Entry(title: "Exploring", image: UIImage(named: "two")!),
        Entry(title: "Traveling Abroad", image: UIImage(named: "three")!),
        Entry(title: "Scuba Diving", image: UIImage(named: "four")!),
        Entry(title: "Trip Together", image: UIImage(named: "five")!),
        Entry(title: "The Unknown", image: UIImage(named: "six")!)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EntryCell
        
        let entry = entries[indexPath.row]
        
        cell.entryTitle.text = entry.title
        cell.entryImage.image = entry.image
        
        return cell;
    }
 
    func configureNavigationController() {
        navigationController?.hidesBarsOnSwipe = true
    }
}

