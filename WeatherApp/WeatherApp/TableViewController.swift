//
//  TableViewController.swift
//  WeatherApp
//
//  Created by 川北紘正 on 2017/08/12.
//  Copyright © 2017年 川北紘正. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
    
    @IBOutlet var WeatherTable: UITableView!
    var urlString = "http://api.openweathermap.org/data/2.5/forecast?units=metric&q=Tokyo&APPID=05fb7646adcb7c0a20d0aad2d771103d"
    var cellNum = 10
    //日付、
    var cellItems = NSMutableArray()
    var cellDay = NSMutableArray()
    var cellWM = NSMutableArray()
    var cellWD = NSMutableArray()
    
    var selectedInfo: String?
    var selectedDay: String?
    var selectedWM: String?
    var selectedWD: String?
    /*
    var weatherymd: String?
    var weatherMain: String?
    var weatherDescription: String?
     */
     var logoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cellNum
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if self.cellItems.count > 0 {
            cell.textLabel?.text = self.cellItems[indexPath.row] as? String
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //_ = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        self.selectedInfo = self.cellItems[indexPath.row] as? String
        self.selectedDay = self.cellDay[indexPath.row] as? String
        self.selectedWM = self.cellWM[indexPath.row] as? String
        self.selectedWD = self.cellWD[indexPath.row] as? String
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetail"){
            let viewController: ViewController = segue.destination as! ViewController
            //ViewControllerのLabelにjsonの値を代入
            viewController.info = self.selectedInfo
            viewController.day = self.selectedDay
            viewController.wm = self.selectedWM
            viewController.wd = self.selectedWD
        }
        
    }
    
    func makeTableData() {
        let url = NSURL(string: self.urlString)!
        let task = URLSession.shared.dataTask(with: url as URL, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
            let json = try!JSON(data: data!)
            // 各セルに情報を突っ込む
            for i in 0 ..< self.cellNum {
                let dt_txt = json["list"][i]["dt_txt"]
                let weatherMain = json["list"][i]["weather"][0]["main"]
                let weatherDescription = json["list"][i]["weather"][0]["description"]
                let info = "\(dt_txt), \(weatherMain), \(weatherDescription)"
                let day = "\(dt_txt)"
                let wm = "\(weatherMain)"
                let wd = "\(weatherDescription)"
                
                print(info)
                self.cellItems[i] = info
                self.cellDay[i] = day
                self.cellWM[i] = wm
                self.cellWD[i] = wd
                
            }
            
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
                
            }
        })
        task.resume()
        
        /*
         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         
         // Configure the cell...
         
         return cell
         }
         */
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
    }
}
