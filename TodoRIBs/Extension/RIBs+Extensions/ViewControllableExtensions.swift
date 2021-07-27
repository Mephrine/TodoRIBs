//
//  ViewControllableExtensions.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/27.
//

import UIKit
import RIBs

extension ViewControllable {
  private var navigationController: UINavigationController? {
    if uiviewController is UINavigationController {
      return uiviewController as? UINavigationController
    } else {
      return uiviewController.navigationController
    }
  }
  
}
