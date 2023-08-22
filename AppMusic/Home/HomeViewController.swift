//
//  ViewController.swift
//  AppMusic
//
//  Created by Gabriel Mors  on 21/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

