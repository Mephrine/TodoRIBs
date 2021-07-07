//
//  RootRouter.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/06/30.
//

import RIBs

protocol RootInteractable: Interactable, MainListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         mainBuilder: MainBuildable) {
        self.mainBuilder = mainBuilder
      super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
  
  override func didLoad() {
    super.didLoad()
    
    routerToMain()
  }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    // MARK: - Private
  private let mainBuilder: MainBuildable
  private var main: MainRouting?
  
  private func routerToMain() {
    let mainRouting = mainBuilder.build(withListener: interactor)
    self.main = mainRouting
    attachChild(mainRouting)
    viewController.present(viewController: mainRouting.viewControllable)
  }
}
