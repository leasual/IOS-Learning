//
//  Workout.swift
//  CustomTableView
//
//  Created by leasual on 16/3/2.
//  Copyright © 2016年 wesoft. All rights reserved.
//

import Foundation
import UIKit

class Workout {

    var videoId: String!
    var title: String!
    var workoutText: String!
    var color: UIColor!
    
    init(title: String, videoId: String, workoutText: String, color: UIColor){
        self.videoId = videoId
        self.title = title
        self.workoutText = workoutText
        self.color = color
    }
    
}