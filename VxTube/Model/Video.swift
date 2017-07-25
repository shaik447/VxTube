//
//  Video.swift
//  VxTube
//
//  Created by shaik mulla syed on 11/2/1438 AH.
//  Copyright © 1438 shaik mulla syed. All rights reserved.
//

import UIKit

struct Video{
    var thumbnailUrl : String
    var videoTitle : String
    var noOfViews : Int
    var timeStamp : Int
    var channel : Channel
    
}

struct Channel{
    var channelName : String
    var userProfileUrl : String
}
