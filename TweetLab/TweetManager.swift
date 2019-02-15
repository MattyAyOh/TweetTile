//
//  TweetManager.swift
//  TweetLab
//
//  Created by Matthew Ao on 2/7/19.
//  Copyright © 2019 AYOH. All rights reserved.
//

import UIKit

struct TweetManager {
   let gameID:String
   
   let numTweetsToShow = 10
   var tweets = [Tweet]()

   mutating func refreshTweets() {
      NotificationCenter.default.post(name: .tweetsWillLoad, object: nil)
      //kick off firebase request
      self.firebaseResponse()
   }
   
   mutating func firebaseResponse() {
      //After receiving response, decode json into Tweet array
      
      var newTweets = [Tweet]()
      //TEMP FAKE TWEETS
      for i in 1...9 {
         var date = Date()
         date.addTimeInterval(TimeInterval(integerLiteral: Int64(-i*866)))
         var tweet = Tweet.init(handle: "MattyAyOh", body: "TestTweet \(i)", timestamp: date, url: URL(string: "www.twitter.com")!, avatar:UIImage.init(named: "twitter")!)
         
         if i == 1 {
            tweet = Tweet.init(handle: "supdood089", body: "When you're Steph Curry and shoot so many 3's 🔥🔥🔥 you forget how to dunk!", timestamp: date, url: URL(string: "www.twitter.com")!, avatar:UIImage.init(named: "twitter")!)
         }
         
         newTweets.append(tweet)
      }
      
      tweets = newTweets.sorted()
      NotificationCenter.default.post(name: .tweetsDidLoad, object: nil)
   }
}
