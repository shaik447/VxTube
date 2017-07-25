//
//  HomeView.swift
//  VxTube
//
//  Created by shaik mulla syed on 7/17/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class HomeView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var videos : [Video]!
    
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
        loadHomefeed()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return (videos != nil) ? videos.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! HomefeedCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 300)
    }
    
    func setupView() {
        addSubview(HomeFeedCollectionView)
        HomeFeedCollectionView.fillSuperview()
    }
    
    func loadHomefeed(){
        let video1 = Video(thumbnailUrl: "colbert", videoTitle: "The Mooch Deletes His Tweets - The Daily Show | Comedy Central The Mooch Deletes His Tweets - The Daily Show", noOfViews: 5800, timeStamp: 180, channel: Channel(channelName: "The Comedy Central UK ", userProfileUrl: "profilepic"))
        let video2 = Video(thumbnailUrl: "colbert", videoTitle: "That one friend who cannot grow a beard", noOfViews: 51000, timeStamp: 18,channel: Channel(channelName: "Tashish chanchalani vines", userProfileUrl: "profilepic"))
        
        let video3 = Video(thumbnailUrl: "colbert", videoTitle: "How to go from military to IOS Developer", noOfViews: 3000, timeStamp: 1320, channel: Channel(channelName: "Lets Build That App", userProfileUrl: "profilepic"))
        
        videos = [video1,video2,video3]
        
    }
    
    
    
}

class HomefeedCell: UICollectionViewCell {

    var video : Video?{
        didSet{
            videothumbnail.image = UIImage(named: video?.thumbnailUrl ?? "colbert")
            channelThumbnail.image = UIImage(named: video?.channel.userProfileUrl ?? "profilepic")
            title.text = video?.videoTitle ?? ""
            print(title.font.pointSize)
            print(title.text?.height(withConstrainedWidth: videoDescription.bounds.width, font: title.font) ?? UIFont.systemFont(ofSize: 16))
        
            
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
//        uiview.layer.borderColor = UIColor.gray.cgColor
//        uiview.layer.borderWidth = 1
        return uiview
    }()
    
    
    var title : UILabel={
        let titlelabel = UILabel()
        titlelabel.text = "Shaik"
        titlelabel.numberOfLines = 2
        titlelabel.font = UIFont.boldSystemFont(ofSize: 14)
        return titlelabel
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
        
        videoDescription.addSubview(title)
        title.anchor(videoDescription.topAnchor, left: videoDescription.leftAnchor, bottom: nil, right: videoDescription.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 44)
        
    }
    
    
}
