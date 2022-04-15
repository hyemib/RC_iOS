//
//  TicketViewController.swift
//  megabox
//
//  Created by hyemi on 2022/04/15.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet weak var findBtn: UIButton!
    @IBOutlet weak var anchorBtn: UIButton!
    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var screenView: UIView!
    @IBOutlet weak var movieView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findBtn.layer.cornerRadius = 17
        anchorBtn.layer.cornerRadius = 17
        cityBtn.layer.cornerRadius = 17
        
        screenView.layer.cornerRadius = 5
        movieView.layer.cornerRadius = 5
        screenView.layer.borderWidth = 0.1
        movieView.layer.borderWidth = 0.1
    }
    

}
