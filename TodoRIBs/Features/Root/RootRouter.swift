//
//  RootRouter.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/30.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  func present(viewController: ViewControllable)
  func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  init(interactor: RootInteractable,
       viewController: RootViewControllable,
       LoggedOutBuilder: LoggedOutBuildable) {
    self.LoggedOutBuilder = LoggedOutBuilder
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    
    routerToLoggedOut()
  }
  
  func cleanupViews() {
    // TODO: Since this router does not own its view, it needs to cleanup the views
    // it may have added to the view hierarchy, when its interactor is deactivated.
  }
  
  // MARK: - Private
  private let LoggedOutBuilder: LoggedOutBuildable
  private var LoggedOutRouting: LoggedOutRouting?
  
  private func routerToLoggedOut() {
    if let LoggedOutRouting = LoggedOutRouting {
      detachChild(LoggedOutRouting)
      self.LoggedOutRouting = nil
    }
    
    let LoggedOutRouting = LoggedOutBuilder.build(withListener: interactor)
    self.LoggedOutRouting = LoggedOutRouting
    attachChild(LoggedOutRouting)
    
    let navigationController = UINavigationController(root: LoggedOutRouting.viewControllable)
    viewController.present(viewController: navigationController)
  }
}
