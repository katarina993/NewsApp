//
//  SplashViewController.swift
//  KacaNewsProject
//
//  Created by Katarina Tomic on 4/6/20.
//  Copyright © 2020 Katarina Tomic. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet var welcomeImage: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        openMainScreen()
    }
    

    func openMainScreen() {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let mainVC = mainStoryboard.instantiateInitialViewController()
      
      if let window = UIApplication.shared.keyWindow {
        window.rootViewController = mainVC
      }
    }

}
