//
//  MainViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/22.
//

import RIBs
import RxSwift
import AsyncDisplayKit

protocol MainPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewController: ASDKViewController<ASDisplayNode>, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?
  
  override init() {
    super.init(node: ASDisplayNode())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
