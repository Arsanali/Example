//
//  GetViewController.swift
//  ImageGet
//
//  Created by arsik on 05.02.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

class GetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
@IBAction func getMethod(_ sender: Any) {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
    let session = URLSession.shared
    session.dataTask(with: url) { (data, response, error) in
      guard
        let data = data,
        let response = response
        else {return}
      print(data)
      
      do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        print(json)
      } catch {
        print(error)
      }
      print(response)
      
    }.resume()
  }
  
  @IBAction func postRequest(_ sender: UIButton) {
     guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
  }
  
}
