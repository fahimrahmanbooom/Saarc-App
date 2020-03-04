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

    let coordinates = ["lat=24&lon=90","lat=20&lon=77","lat=30&lon=70","lat=7&lon=81","lat=28&lon=84","lat=3.15&lon=73","lat=27.30&lon=90.30","lat=33&lon=65"]
    
    var webView = WebTemplateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.indicatorStyle = .white
        getDataFromServer()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.tintColor = .systemTeal
        
        DispatchQueue.main.async {
            cell.configure(appData: self.data[indexPath.row])
            if indexPath.row < self.temp.count {
                cell.tempLabel.text = self.temp[indexPath.row]
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        webView = webViewPusher()
        let countries = ["bd","in","pk","sl","np","mv","bh","af"]
        
        for i in 0...7{
            
            if indexPath.row == i {
                webView.stringValue = countries[i]
            }
        }
    }
    
    func webViewPusher() -> WebTemplateViewController {
        
        webView = self.storyboard?.instantiateViewController(withIdentifier: "WebTemplateViewController") as! WebTemplateViewController
        self.navigationController?.pushViewController(webView, animated: true)
        return webView
    }
    
    
    func getDataFromServer() {
        
        for i in 0...7 {
            guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?\(coordinates[i])&units=metric&appid=6323268a634da5d67187daeaf7e0d1c5") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let data = data, error == nil {
                    do {
                        guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                        guard let weatherMain = json["main"] as? [String: Any] else { return }
                        let temp = Int(weatherMain["temp"] as? Double ?? 0)
                        self.temp.append(String("\(temp)° C"))
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    catch {
                        print("error")
                    }
                }
            }.resume()
        }
    }
}
