//
//  mentor.swift
//  MentorBook
//
//  Created by Tyler Inari on 2020/09/19.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class Mentor {
    var name: String!
    var course: String!
    var imageName: String!
    
    init(name: String, course: String, imageName: String) {
        self.name = name
        self.course = course
        self.imageName = imageName
    }
    
    func getImage() -> UIImage {
        return UIImage(named: imageName)!
    }
}
