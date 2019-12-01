//
//  ViewController.swift
//  Saarc App
//
//  Created by Fahim Rahman on 29/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let data: [ImageAndNameData] = [
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagBangladesh"), countryNameArray: "বাংলাদেশ", capitalNameArray: "রাজধানীঃ ঢাকা"),
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagIndia"), countryNameArray: "ভারত", capitalNameArray: "রাজধানীঃ নয়া দিল্লি"),
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagPakistan"), countryNameArray: "পাকিস্তান", capitalNameArray: "রাজধানীঃ ইসলামাবাদ"),
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagSrilanka"), countryNameArray: "শ্রীলঙ্কা", capitalNameArray: "রাজধানীঃ শ্রী জয়াবর্ধেনেপুরা"),
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagNepal"), countryNameArray: "নেপাল", capitalNameArray: "রাজধানীঃ কাঠমান্ডু"),
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagMaldive"), countryNameArray: "মালদ্বীপ", capitalNameArray: "রাজধানীঃ মালে"),
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagBhutan"), countryNameArray: "ভূটান", capitalNameArray: "রাজধানীঃ থিম্পু"),
        ImageAndNameData(countryImageArray: #imageLiteral(resourceName: "FlagAfghanistan"), countryNameArray: "আফগানিস্তান", capitalNameArray: "রাজধানীঃ কাবুল")
    ]

    @IBOutlet weak var tableView: UITableView!
   
    var temp = [String]()
    
    var countryCode = ["bd","in","pk","lk","np","mv","bt","af"]
    var zipCode = ["1100","110001","44000","10100","44600","20002","11002","1001"]
    
    var webView = WebTemplateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.configure(appData: data[indexPath.row])
        getDataFromServer(zipCode: zipCode[temp.count], countryCode: countryCode[temp.count])
        //print(indexPath.row)
        //cell.tempLabel.text = temp[indexPath.row]
        print(temp)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.toTheWebView(_:)))
        cell.isUserInteractionEnabled = true
        cell.contentView.tag = indexPath.row
        cell.contentView.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    
    @objc func toTheWebView(_ sender: AnyObject) {
         webView = viewPusher()

        if sender.view.tag == 0 {
             webView.stringValue = "bangladesh"
         }
         if sender.view.tag == 1 {
             webView.stringValue = "india"
         }
         if sender.view.tag == 2 {
             webView.stringValue = "pakistan"
         }
         if sender.view.tag == 3 {
             webView.stringValue = "srilanka"
         }
         if sender.view.tag == 4 {
             webView.stringValue = "nepal"
         }
         if sender.view.tag == 5 {
            webView.stringValue = "maldive"
         }
         if sender.view.tag == 6 {
            webView.stringValue = "bhutan"
         }
         if sender.view.tag == 7 {
            webView.stringValue = "afganistan"
         }
    }
    
    func viewPusher() -> WebTemplateViewController {
        webView = self.storyboard?.instantiateViewController(identifier: "WebTemplateViewController") as! WebTemplateViewController
        self.navigationController?.pushViewController(webView, animated: true)
        
        return webView
    }
    
    func getDataFromServer(zipCode: String, countryCode: String) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?zip=\(zipCode),\(countryCode)&units=metric&appid=a8cfe6569f9845178311e7dd8bb31cdf") else { return }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let data = data, error == nil {
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                    guard let weatherMain = json["main"] as? [String: Any] else { return }
                    let temp = Int(weatherMain["temp"] as? Double ?? 0)
                    DispatchQueue.main.async {
                       // print(temp)
                        self.temp.append(String("\(temp)"))
                        //self.tableView.reloadData()
                    }
                   
                }
                catch {
                    print("error")
                }
            }
        }
        task.resume()
    }
}
