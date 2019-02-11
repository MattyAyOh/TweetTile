//
//  TweetTileView.swift
//  TweetLab
//
//  Created by Matthew Ao on 2/10/19.
//  Copyright © 2019 AYOH. All rights reserved.
//

import UIKit

class TweetTileView: UIView {
   let backingTweet: Tweet
   
   @IBOutlet var contentView: UIView!

   @IBOutlet var avatarImageView: UIImageView!
   @IBOutlet var handleLabel: UILabel!
   @IBOutlet var bodyLabel: UITextView!
   @IBOutlet var timestampLabel: UILabel!
   
   override convenience init(frame: CGRect) {
      fatalError("need to init from custom frame init")
   }
   
   init(frame: CGRect, tweet:Tweet)
   {
      self.backingTweet = tweet
      
//      self.avatarImageView = UIImageView(frame: frame.insetBy(dx: 3.0, dy: 3.0))
//      self.avatarImageView.image = tweet.avatar

//      self.handleLabel = TweetTileView.createLabel(inFrame: frame, withText: tweet.handle)
//
//      self.bodyLabel = TweetTileView.createLabel(inFrame: frame, withText: tweet.body)

//      let formatter = DateFormatter()
//      formatter.dateFormat = "HH:mm, MMM dd"
//      let dateString = formatter.string(from: tweet.timestamp)
//      self.timestampLabel = TweetTileView.createLabel(inFrame: frame, withText: dateString)
//
      super.init(frame: frame)
      commonInit(forFrame: frame)
      
      let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.tileTapped (_:)))
      self.addGestureRecognizer(gesture)
      self.bounds = self.frame.insetBy(dx: 1.0, dy: 1.0)
      self.layer.cornerRadius = 5.0
      self.backgroundColor = UIColor.red
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   func commonInit(forFrame frame:CGRect) {
      Bundle.main.loadNibNamed("TweetTileView", owner: self, options: nil)
      self.addSubview(contentView)
      contentView.frame = frame
      contentView.translatesAutoresizingMaskIntoConstraints = true
      contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
   }

   fileprivate class func createLabel(inFrame frame:CGRect, withText text:String) -> UILabel {
      let label = UILabel(frame: frame.insetBy(dx: 5.0, dy: 5.0))
      label.text = text
      label.textAlignment = .center
      label.adjustsFontSizeToFitWidth = true
      
      return label
   }
   
   @objc func tileTapped(_ sender:UITapGestureRecognizer) {
      //open browser with twitter url
//      backingTweet.url
   }


}
