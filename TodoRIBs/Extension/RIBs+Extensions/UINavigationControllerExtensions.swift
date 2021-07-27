//
//  UINavigationController+RIBs.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/12.
//

import UIKit
import RIBs

extension UINavigationController: ViewControllable {
  public var uiviewController: UIViewController {
    return self
  }
  
  convenience init(root: ViewControllable) {
    self.init(rootViewController: root.uiviewController)
  }
}
