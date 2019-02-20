//
//  UIView+.swift
//  TweetLab
//
//  Created by Matthew Ao on 2/10/19.
//  Copyright © 2019 AYOH. All rights reserved.
//

import UIKit

extension UIView
{
   func fixInView(_ container: UIView!) -> Void{
      self.translatesAutoresizingMaskIntoConstraints = false
      container.addSubview(self)
      self.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
      self.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
      self.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
      self.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
   }
}
