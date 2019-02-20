//
//  Date+TimeAgo.swift
//  TweetLab
//
//  Created by Matthew Ao on 2/14/19.
//  Copyright © 2019 AYOH. All rights reserved.
//

import Foundation

extension Date {
   var timestampString: String? {
      let formatter = DateComponentsFormatter()
      formatter.unitsStyle = .full
      formatter.maximumUnitCount = 1
      formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
      
      guard let timeString = formatter.string(from: self, to: Date()) else {
         return nil
      }
      
      let formatString = NSLocalizedString("%@ ago", comment: "")
      return String(format: formatString, timeString)
   }
}
