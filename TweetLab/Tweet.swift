//
//  Tweet.swift
//  TweetLab
//
//  Created by Matthew Ao on 2/7/19.
//  Copyright © 2019 AYOH. All rights reserved.
//

import Foundation

struct Tweet: Comparable {
   let handle: String
   let body: String
   let timestamp: Date
   let url: URL
   
   static func < (lhs: Tweet, rhs: Tweet) -> Bool {
      return lhs.timestamp < rhs.timestamp
   }
}
