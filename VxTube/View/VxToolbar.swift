//
//  VxToolbarButton.swift
//  VxTube
//
//  Created by shaik mulla syed on 6/29/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class VxToolbar: UIStackView {
    
    var btnIcons = [UIButton]()
    var tabViews = [String:UIView]()
    let noofIcons = 4
    
    
    let homeIcon : UIButton = {
        
        let homebtn = UIButton()
        homebtn.setImage(#imageLiteral(resourceName: "home-1").withRenderingMode(.alwaysTemplate), for: .normal)
        homebtn.tintColor = btnOriginalColor
        homebtn.setTitle("Home", for: .normal)
        homebtn.setTitleColor(btnOriginalColor, for: .normal)
        homebtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        homebtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        homebtn.setTitleColor(.red, for: .selected)
        homebtn.addTarget(self, action: #selector(btnClicked(button:)), for: .touchUpInside)
        return homebtn
    }()
    
    let trendingIcon : UIButton = {
        let homebtn = UIButton()
        homebtn.setImage(#imageLiteral(resourceName: "trending").withRenderingMode(.alwaysTemplate), for: .normal)
        homebtn.tintColor = btnOriginalColor
        homebtn.setTitle("Trending", for: .normal)
        homebtn.setTitleColor(btnOriginalColor, for: .normal)
        homebtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        homebtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        homebtn.setTitleColor(.red, for: .selected)
        homebtn.addTarget(self, action: #selector(btnClicked(button:)), for: .touchUpInside)
        return homebtn
    }()
    
    let subscriptionsIcon : UIButton = {
        let homebtn = UIButton()
        homebtn.setImage(#imageLiteral(resourceName: "subscriptions").withRenderingMode(.alwaysTemplate), for: .normal)
        homebtn.setTitle("Subscriptions", for: .normal)
        homebtn.tintColor = btnOriginalColor
        homebtn.setTitleColor(btnOriginalColor, for: .normal)
        homebtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        homebtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        homebtn.setTitleColor(.red, for: .selected)
        homebtn.addTarget(self, action: #selector(btnClicked(button:)), for: .touchUpInside)
        return homebtn
    }()
    
    let accountIcon : UIButton = {
        let homebtn = UIButton()
        homebtn.setImage(#imageLiteral(resourceName: "account").withRenderingMode(.alwaysTemplate), for: .normal)
        homebtn.setTitle("Library", for: .normal)
        homebtn.tintColor = btnOriginalColor
        homebtn.setTitleColor(btnOriginalColor, for: .normal)
        homebtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        homebtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        homebtn.setTitleColor(.red, for: .selected)
        homebtn.addTarget(self, action: #selector(btnClicked(button:)), for: .touchUpInside)
        
        return homebtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func btnClicked(button: UIButton){
        
        for btn in btnIcons{
            if btn.titleLabel?.text == button.titleLabel?.text{
                btn.tintColor = .red
                btn.isSelected = true
                setView(tabname: (btn.titleLabel?.text)!)
            }else{
                btn.tintColor = btnOriginalColor
                btn.isSelected = false
            }
            
        }
    }
    
    func setupViews(){
        self.distribution = .equalSpacing
        btnIcons.append(contentsOf: [homeIcon,trendingIcon,subscriptionsIcon,accountIcon])
        
        for btn in btnIcons {
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(btn)
            btn.alignVertical(spacing: -2.0)
            
            //do not set any height or width anchor to the button. Stackview arranges the icon as per the button size and aligns it with equal spacing
            //btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
            //iconbtn1.heightAnchor.constraint(equalToConstant: 32).isActive = true
            
        }
        
    }
    
    func setDefaultView(tabname:String)
    {
        btnIcons.forEach { (btn) in
            if btn.titleLabel?.text == tabname{
                btn.tintColor = .red
                btn.isSelected = true
            }
        }
        setView(tabname: tabname)
    
    }
    
    func setView(tabname:String) {
        let _ = tabViews.map{$0.value.isHidden=true}
        let selectedView = tabViews[tabname]
        selectedView?.isHidden = false
        
    }
    
    
    
    

}
