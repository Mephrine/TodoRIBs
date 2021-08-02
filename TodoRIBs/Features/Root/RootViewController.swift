//
//  RootViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/30.
//

import RIBs

protocol RootPresentableListener: AnyObject {
  
}

final class RootViewController: BaseViewController, RootPresentable, RootViewControllable {
  weak var listener: RootPresentableListener?
  
  
  func present(viewController: ViewControllable) {
    viewController.uiviewController.modalPresentationStyle = .fullScreen
    present(viewController.uiviewController, animated: false, completion: nil)
  }
  
  func dismiss(viewController: ViewControllable) {
    if presentedViewController === viewController.uiviewController {
      dismiss(animated: true, completion: nil)
    }
  }
  
}
