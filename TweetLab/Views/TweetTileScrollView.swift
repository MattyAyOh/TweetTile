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
   let progressSpinner:UIActivityIndicatorView
   
   required init?(coder aDecoder: NSCoder) {
      tweetManager = TweetManager.init()
      scrollView = UIScrollView()
      tileStack = UIStackView()
      progressSpinner = UIActivityIndicatorView(style: .gray)
      super.init(coder: aDecoder)
      progressSpinner.frame = self.bounds
      progressSpinner.hidesWhenStopped = true
      self.addSubview(progressSpinner)
      
      tileStack.frame = self.bounds
      tileStack.axis = .horizontal
      tileStack.distribution = .fillEqually
      
      scrollView.frame = self.bounds
      scrollView.isPagingEnabled = true
      scrollView.showsVerticalScrollIndicator = false
      scrollView.showsHorizontalScrollIndicator = false
      self.addSubview(scrollView)
      scrollView.addSubview(tileStack)
      tileStack.translatesAutoresizingMaskIntoConstraints = true
      tileStack.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]

      NotificationCenter.default.addObserver(self, selector: #selector(tweetsWillLoad(notification:)), name: .tweetsWillLoad, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(tweetsDidLoad(notification:)), name: .tweetsDidLoad, object: nil)
   }
   
   @objc func tweetsWillLoad(notification:Notification) {
      scrollView.isHidden = true
      progressSpinner.startAnimating()
   }
   
   @objc func tweetsDidLoad(notification:Notification) {
      let scrollWidth = CGFloat(tweetManager.tweets.count) * scrollView.frame.width
      scrollView.contentSize = CGSize.init(width: scrollWidth, height: scrollView.frame.height)
      tileStack.frame = CGRect.init(x: 0, y: 0, width: scrollWidth, height: scrollView.frame.height)
      scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
      scrollView.isHidden = false
      
      for tile in tileStack.subviews {
         tile.removeFromSuperview()
      }
      
      var i:CGFloat = 0
      for tweet in tweetManager.tweets {
         let newTile = TweetTileView.init(frame: scrollView.bounds, tweet:tweet)
         tileStack.addArrangedSubview(newTile)
         i += 1
      }
      
      progressSpinner.stopAnimating()
   }
}
