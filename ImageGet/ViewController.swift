//
//  ViewController.swift
//  ImageGet
//
//  Created by arsik on 04.02.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var labelName: UILabel!
  
  @IBOutlet weak var imageGet: UIImageView!
  
  @IBOutlet weak var startButton: UIButton!
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    activityIndicator.isHidden = true
    activityIndicator.hidesWhenStopped = true
 
  }
  
  
  @IBAction func ActionBtn(_ sender: Any) {
    self.labelName.isHidden = true
    self.startButton.isEnabled = false
    activityIndicator.isHidden = true
    activityIndicator.startAnimating()
    
    guard let url = URL(string: "https://habrastorage.org/webt/i-/tl/sa/i-tlsagkacd2zdsmpd70er1tv4a.png") else {return}
    activityIndicator.startAnimating()
     let session = URLSession.shared
     
     session.dataTask(with: url) { (data, response, error) in
       if let data = data , let image = UIImage(data: data) {
         DispatchQueue.main.async {
           self.activityIndicator.stopAnimating()

           self.startButton.isHidden = true
           self.imageGet.image = image
         }
       }
    }.resume()
  }
}

