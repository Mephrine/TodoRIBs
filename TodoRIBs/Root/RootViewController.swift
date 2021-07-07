//
//  RootViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/30.
//

import AsyncDisplayKit
import RIBs

protocol RootPresentableListener: AnyObject {
  
}

class RootViewController: ASNavigationController, RootPresentable, RootViewControllable {
  weak var listener: RootPresentableListener?
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Method is not supported")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
  }
  
  func present(viewController: ViewControllable) {
      present(viewController.uiviewController, animated: true, completion: nil)
  }
}
