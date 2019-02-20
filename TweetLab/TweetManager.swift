//
//  TweetManager.swift
//  TweetLab
//
//  Created by Matthew Ao on 2/7/19.
//  Copyright © 2019 AYOH. All rights reserved.
//

import UIKit
import Firebase

class TweetManager {
   let gameID:String = ""
   
   let numTweetsToShow = 10
   var tweets = [Tweet]()
   
   init() {
      let db = Firestore.firestore()
      db.collection("tweets").addSnapshotListener { (collectionSnapshot, error) in
         if collectionSnapshot == nil {
            print("Error fetching collection: \(error!)")
            return
         }
         self.reloadTweets()
      }
   }
   
   func reloadTweets() {
      NotificationCenter.default.post(name: .tweetsWillLoad, object: nil)
      //kick off firebase request
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
         let db = Firestore.firestore()
         db.collection("tweets").getDocuments() { (querySnapshot, err) in
            self.firebaseGotDocuments(querySnapshot: querySnapshot, err: err)
         }
      }
   }
   
   func firebaseGotDocuments(querySnapshot:QuerySnapshot?, err:Error?) {
      if let err = err {
         print("Error getting documents: \(err)")
      } else {
         var newTweets = [Tweet]()
         
         for document in querySnapshot!.documents {
            print("\(document.documentID) => \(document.data())")
            let data = document.data()
            let handle = (data["handle"] as? String ) ?? ""
            let body = (data["body"] as? String) ?? ""
            let timestamp = document["timestamp"] as! Timestamp
            let date = timestamp.dateValue()
            let urlString = (document["url"] as? String) ?? ""
            let url = URL.init(string: urlString) ?? URL.init(string: "http://www.google.com")!
            let avatar = UIImage.init(named:"twitter")!
            
            let tweet = Tweet.init(handle: handle, body: body, timestamp: date, url: url, avatar: avatar)
            newTweets.append(tweet)
         }
         
         tweets = newTweets.sorted()
         NotificationCenter.default.post(name: .tweetsDidLoad, object: nil)
      }
   }
}
