//
//  LoggedOutRouter.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/22.
//

import RIBs

protocol LoggedOutInteractable: Interactable {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}

protocol LoggedOutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable>, LoggedOutRouting {
  
  private let signupBuilder: SignupBuildable
  private var signupRouting: SignupRouting?

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoggedOutInteractable,
                  viewController: LoggedOutViewControllable,
                  signupBuilder: SignupBuildable) {
      self.signupBuilder = signupBuilder
      
      super.init(interactor: interactor, viewController: viewController)
      interactor.router = self
    }
  
  func routeToSignupRIB() {
    let signupRouting = signupBuilder.build(withListener: interactor)
  }
}
