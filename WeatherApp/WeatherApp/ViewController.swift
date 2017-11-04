//
//  ViewController.swift
//  WeatherApp
//
//  Created by 川北紘正 on 2017/08/12.
//  Copyright © 2017年 川北紘正. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var info: String?
    var day: String?
    var wm: String?
    var wd: String?
    @IBOutlet weak var ymdLabel: UILabel!
    @IBOutlet weak var weMainLabel: UILabel!
    @IBOutlet weak var weDescriptionLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoLabel?.text = self.info
        self.ymdLabel?.text = self.day
        self.weMainLabel?.text = self.wm
        self.weDescriptionLabel?.text = self.wd

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

