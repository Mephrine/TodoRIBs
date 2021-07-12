//
//  TodoRIBsTests.swift
//  TodoRIBsTests
//
//  Created by Mephrine on 2021/06/22.
//

@testable import TodoRIBs
import RIBs
import RxSwift
import UIKit

class RootInteractableMock: RootInteractable {
  // Variables
  var router: RootRouting? { didSet { routerSetCallCount += 1 } }
  var routerSetCallCount = 0
  var listener: RootListener? { didSet { listenerSetCallCount += 1 } }
  var listenerSetCallCount = 0
  var isActive: Bool = false { didSet { isActiveSetCallCount += 1 } }
  var isActiveSetCallCount = 0
  var isActiveStreamSubject: PublishSubject<Bool> = PublishSubject<Bool>() { didSet { isActiveStreamSubjectSetCallCount += 1 } }
  var isActiveStreamSubjectSetCallCount = 0
  var isActiveStream: Observable<Bool> { return isActiveStreamSubject }
  
  // Function Handlers
  var activateHandler: (() -> Void)?
  var activateCallCount: Int = 0
  var deactivateHandler: (() -> Void)?
  var deactivateCallCount: Int = 0
  var loginHandler: (() -> Void)?
  var loginCallCount: Int = 0
  
  init() {
  }
  
  func activate() {
    activateCallCount += 1
    if let activateHandler = activateHandler {
      return activateHandler()
    }
  }
  
  func deactivate() {
    deactivateCallCount += 1
    if let deactivateHandler = deactivateHandler {
      return deactivateHandler()
    }
  }
  
  func login() {
    loginCallCount += 1
    if let loginHandler = loginHandler {
      return loginHandler()
    }
  }
}

class RootViewControllableMock: RootViewControllable {
  // Variables
  var uiviewController: UIViewController = UIViewController() { didSet { uiviewControllerSetCallCount += 1 } }
  var uiviewControllerSetCallCount = 0
  
  // Function Handlers
  var presentHandler: ((_ viewController: ViewControllable) -> ())?
  var presentCallCount: Int = 0
  var dismissHandler: ((_ viewController: ViewControllable) -> ())?
  var dismissCallCount: Int = 0
  
  init() {
  }
  
  func present(viewController: ViewControllable) {
    presentCallCount += 1
    if let presentHandler = presentHandler {
      return presentHandler(viewController)
    }
  }
  
  func dismiss(viewController: ViewControllable) {
    dismissCallCount += 1
    if let dismissHandler = dismissHandler {
      return dismissHandler(viewController)
    }
  }
}
