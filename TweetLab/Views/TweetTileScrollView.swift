//
//  TweetTileScrollView.swift
//  TweetLab
//
//  Created by Matthew Ao on 2/10/19.
//  Copyright © 2019 AYOH. All rights reserved.
//

import UIKit

class TweetTileScrollView: UIView {
   let tiles = [TweetTileView]()
   var tweetManager: TweetManager
   let scrollView:UIScrollView
   let tileStack:UIStackView
   
   required init?(coder aDecoder: NSCoder) {
      tweetManager = TweetManager.init(gameID: "fake", tweets: [])
      tweetManager.refreshTweets()
      scrollView = UIScrollView()
      tileStack = UIStackView()
      super.init(coder: aDecoder)
      scrollView.frame = self.bounds
      tileStack.frame = self.bounds
      let scrollWidth = CGFloat(tweetManager.tweets.count) * scrollView.frame.width
      scrollView.contentSize = CGSize.init(width: scrollWidth, height: scrollView.frame.height)
      scrollView.showsVerticalScrollIndicator = false
      scrollView.showsHorizontalScrollIndicator = false
      self.addSubview(scrollView)
      
      tileStack.axis = .horizontal
      tileStack.distribution = .fillEqually
      
      scrollView.addSubview(tileStack)
      tileStack.frame = CGRect.init(x: 0, y: 0, width: scrollWidth, height: scrollView.frame.height)
      tileStack.translatesAutoresizingMaskIntoConstraints = true
      tileStack.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
      
      var i:CGFloat = 0
      for tweet in tweetManager.tweets {
         let newTile = TweetTileView.init(frame: scrollView.bounds, tweet:tweet)
         tileStack.addArrangedSubview(newTile)
         i += 1
      }
   }
}
