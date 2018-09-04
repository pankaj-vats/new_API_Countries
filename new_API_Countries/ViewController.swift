//
//  ViewController.swift
//  new_API_Countries
//
//  Created by pankaj vats on 04/09/18.
//  Copyright © 2018 pankaj vats. All rights reserved.
//

import UIKit
import Alamofire

class AlarmofireViewController: UIViewController {
    
    let url = "https://restcountries.eu/rest/v2/all"
    
    var arr = [String]()
    var arr1 = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJsonWithURL()
        
    }
    
    
    func downloadJsonWithURL()
    {
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            let valueOfResultInResponse = response.result.value
            let Countries = valueOfResultInResponse as! NSArray
            //            print(Countries)
            for countrys in Countries
            {
                if let country = countrys as? NSDictionary
                {
                     let capital = country.value(forKey: "capital") as! String
                    
                    self.arr1.append(capital )
                    
                    
                     let name = country["name"] as! String
                    
                    self.arr.append(name )
                    
                    print("\(name):\t\(capital)")
                }
            }
            
// ------********* FOR NEXT LINE ********-------------
            
//            for b in self.arr1
//            {
//                print(b)
//            }
//
//
//
//            for a in self.arr
//            {
//                print(a)
//            }
            
            
            
        }
    }
    
}
