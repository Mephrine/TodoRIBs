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

final class RootViewController: ASDKViewController<ASDisplayNode>, RootPresentable, RootViewControllable {
  weak var listener: RootPresentableListener?
  
  override init() {
    let displayNode = ASDisplayNode()
    displayNode.backgroundColor = .white
    displayNode.automaticallyManagesSubnodes = true
    super.init(node: displayNode)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
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
