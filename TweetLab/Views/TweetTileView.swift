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
      super.init(frame: frame)

      Bundle.main.loadNibNamed("TweetTileView", owner: self, options: nil)
      self.addSubview(contentView)
      contentView.frame = frame
      contentView.bounds = frame.insetBy(dx: 10.0, dy: 10.0)
      contentView.translatesAutoresizingMaskIntoConstraints = true
      contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
      contentView.layer.cornerRadius = 10.0
      
      self.avatarImageView.image = tweet.avatar
      self.handleLabel.text = tweet.handle
      self.bodyLabel.text = tweet.body
      self.timestampLabel.text = tweet.timestamp.timestampString
      
      let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.tileTapped (_:)))
      self.addGestureRecognizer(gesture)
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   fileprivate class func createLabel(inFrame frame:CGRect, withText text:String) -> UILabel {
      let label = UILabel(frame: frame.insetBy(dx: 5.0, dy: 5.0))
      label.text = text
      label.textAlignment = .center
      label.adjustsFontSizeToFitWidth = true
      
      return label
   }
   
   @objc func tileTapped(_ sender:UITapGestureRecognizer) {
      UIApplication.shared.open(backingTweet.url, options: [:], completionHandler: nil)
   }


}
