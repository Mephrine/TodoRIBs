//
//  LoggedOutViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/22.
//

import RIBs
import RxSwift
import AsyncDisplayKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: ASDKViewController<ASDisplayNode>, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
  
  override init() {
    let displayNode = ASDisplayNode()
    displayNode.backgroundColor = .white
    displayNode.automaticallyManagesSubnodes = true
    super.init(node: displayNode)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
