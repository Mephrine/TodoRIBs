//
//  LoggedOutMocks.swift
//  TodoRIBsTests
//
//  Created by Mephrine on 2021/07/12.
//

@testable import TodoRIBs
import RIBs
import RxSwift
import UIKit

class LoggedOutInteractableMock: LoggedOutInteractable {
  // Variable
  var isActive = false { didSet { isActiveSetCallCount += 1 } }
  var isActiveSetCallCount = 0
  
  var isActiveStream: Observable<Bool> { return isActiveStreamSubject }
  var isActiveStreamSubject = PublishSubject<Bool>() { didSet { isActiveStreamSubjectSetCallCount += 1 } }
  var isActiveStreamSubjectSetCallCount = 0
  
  var router: LoggedOutRouting? { didSet { routerSetCallCount += 1} }
  var routerSetCallCount = 0
  
  var listener: LoggedOutListener? { didSet { listenerSetCallCount += 1} }
  var listenerSetCallCount = 0
  
  // Function Handlers
  var activeHandler: (() -> Void)?
  var activeCallCount = 0
  
  var deactiveHandler: (() -> Void)?
  var deactiveCallCount = 0
  
  init() {
    
  }
  
  func activate() {
    activeCallCount += 1
    if let activeHandler = activeHandler {
      return activeHandler()
    }
  }
  
  func deactivate() {
    deactiveCallCount += 1
    if let deactiveHandler = deactiveHandler {
      return deactiveHandler()
    }
  }
}

class LoggedOutViewControllableMock: LoggedOutViewControllable, LoggedOutPresentable {
  // Variables
  var uiviewController: UIViewController = UIViewController() { didSet { uiviewControllerSetCallCount += 1 } }
  var uiviewControllerSetCallCount = 0
  
  var listener: LoggedOutPresentableListener?
    
  // Function Handlers
  var failedLoginHandler: (() -> Void)?
  var failedLoginError: LoginError? = nil
  
  init() {
  }
  
  func failedLogin(error: LoginError) {
    failedLoginError = error
    if let failedLoginHandler = failedLoginHandler {
      return failedLoginHandler()
    }
  }
}

class LoggedOutListenerMocks: LoggedOutListener {
  func login() {
  }
}

class LoggedOutRoutingMock: LoggedOutRouting {
  var viewControllable: ViewControllable
  
  var interactable: Interactable { didSet { interactableSetCallCount += 1 } }
  var interactableSetCallCount = 0
  
  var children: [Routing] = [Routing]() { didSet { childrenSetCallCount += 1 } }
  var childrenSetCallCount = 0
  
  var lifecycleSubject: PublishSubject<RouterLifecycle> = PublishSubject<RouterLifecycle>() { didSet { lifecycleSubjectSetCallCount += 1 } }
  var lifecycleSubjectSetCallCount = 0
  var lifecycle: Observable<RouterLifecycle> { return lifecycleSubject }
  
  // Function Handlers
  var cleanupViewsHandler: (() -> Void)?
  var cleanupViewsCallCount: Int = 0
  
  var loadHandler: (() -> Void)?
  var loadCallCount: Int = 0
  
  var attachChildHandler: ((_ child: Routing) -> Void)?
  var attachChildCallCount: Int = 0
  
  var detachChildHandler: ((_ child: Routing) -> Void)?
  var detachChildCallCount: Int = 0
  
  var detachMemosHandler: (() -> Void)?
  var detachMemosCallCount: Int = 0
  
  var routeToMemosHandler: (() -> Void)?
  var routeToMemosCallCount: Int = 0
  
  init(interactable: LoggedOutInteractable, viewControllable: ViewControllable) {
    self.interactable = interactable
    self.viewControllable = viewControllable
  }

  func cleanupViews() {
      cleanupViewsCallCount += 1
      if let cleanupViewsHandler = cleanupViewsHandler {
          return cleanupViewsHandler()
      }
  }
  
  func load() {
      loadCallCount += 1
      if let loadHandler = loadHandler {
          return loadHandler()
      }
  }

  func attachChild(_ child: Routing) {
      attachChildCallCount += 1
      if let attachChildHandler = attachChildHandler {
          return attachChildHandler(child)
      }
  }

  func detachChild(_ child: Routing) {
      detachChildCallCount += 1
      if let detachChildHandler = detachChildHandler {
          return detachChildHandler(child)
      }
  }
}

class LoggedOutBuildableMock: LoggedOutBuildable {
  var buildHandler: ((_ listener: LoggedOutListener) -> LoggedOutRouting)?
  var buildCallCount: Int = 0
  
  func build(withListener listener: LoggedOutListener) -> LoggedOutRouting {
    buildCallCount += 1
    if let buildHandler = buildHandler {
      return buildHandler(listener)
    }
    fatalError("Function build returns a value that can't be handled with a default value and its handler must be set")
  }
}
