//
//  HomeView.swift
//  VxTube
//
//  Created by shaik mulla syed on 7/17/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class HomeView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    lazy var HomeFeedCollectionView : UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        flowlayout.minimumLineSpacing = 0
        let homeCollectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        homeCollectionview.register(HomefeedCell.self, forCellWithReuseIdentifier: "cellid")
        homeCollectionview.backgroundColor = .white
        homeCollectionview.dataSource = self
        homeCollectionview.delegate = self
        return homeCollectionview
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
    
    func setupView() {
        addSubview(HomeFeedCollectionView)
        HomeFeedCollectionView.fillSuperview()
        
        
    }
    
    
    
}

class HomefeedCell: UICollectionViewCell {
    private var _title : String!
    private var _channelName : String!
    private var _noofviews : Int!
    private var _hoursago : Int!
    
    var title : String? {
        didSet{
            _title = title
        }
    }
    
    var channelName : String? {
        didSet{
            _channelName = channelName
        }
    }
    
    var videothumbnail : UIImageView = {
       let imageview  = UIImageView()
        imageview.image = #imageLiteral(resourceName: "colbert")
        imageview.contentMode = UIViewContentMode.scaleToFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    var channelThumbnail : UIImageView = {
        let thumbnail = UIImageView()
        thumbnail.image = #imageLiteral(resourceName: "profilepic")
        thumbnail.contentMode = .scaleToFill
        thumbnail.frame.size = CGSize(width: 48, height: 48)
        thumbnail.layer.cornerRadius = thumbnail.frame.width / 2
        thumbnail.clipsToBounds = true
        return thumbnail
    }()
    
    var videoDescription : UIView = {
        let uiview = UIView()
        //uiview.backgroundColor = .red
        uiview.layer.borderColor = UIColor.gray.cgColor
        uiview.layer.borderWidth = 1
        return uiview
    }()
    
    var fullDescription : UITextView = {
        let label = UITextView()
        label.text = "Shaik"
        label.backgroundColor = .clear
        return label
    }()
    
    var seperator : UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .gray
        uiview.frame.size.height = 1
        return uiview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setupViews(){
        self.backgroundColor = UIColor.white
        addSubview(videothumbnail)
        addSubview(channelThumbnail)
        addSubview(videoDescription)
        addSubview(seperator)
        videothumbnail.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: -10, widthConstant: 0, heightConstant: 194)
        
        channelThumbnail.anchor(videothumbnail.bottomAnchor, left: videothumbnail.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 48, heightConstant: 48)
        videoDescription.anchor(videothumbnail.bottomAnchor, left: channelThumbnail.rightAnchor, bottom: self.bottomAnchor, right: videothumbnail.rightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: -10, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        seperator.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
        videoDescription.addSubview(fullDescription)
        fullDescription.fillSuperview()
        
    }
    
    
}
