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
    var ymd: String?
    var weMain: String?
    var weDescription: String?
    @IBOutlet weak var ymdLabel: UILabel!
    @IBOutlet weak var weMainLabel: UILabel!
    @IBOutlet weak var weDescriptionLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoLabel?.text = self.info
        self.ymdLabel?.text = self.ymd
        self.weMainLabel?.text = self.weMain
        self.weDescriptionLabel?.text = self.weDescription

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

