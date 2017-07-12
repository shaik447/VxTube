//
//  HomeVC.swift
//  VxTube
//
//  Created by shaik mulla syed on 6/28/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var dividerView: UIView!
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var trendingView: UIView!
    @IBOutlet weak var subscriptionView: UIView!
    @IBOutlet weak var accountView: UIView!
    
    @IBOutlet weak var vxtoolbar: VxToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupViews(){
        accountImageView.layer.cornerRadius = accountImageView.frame.width/2
        accountImageView.clipsToBounds = true
        videoBtn.imageView?.image = #imageLiteral(resourceName: "CamCorder").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        videoBtn.tintColor = .white
        
        vxtoolbar.tabViews = [
            "Home":homeView,
            "Trending":trendingView,
            "Subscriptions":subscriptionView,
            "Library":accountView]
        
        vxtoolbar.setDefaultView(tabname: "Home")

        
    }

  

    

}
