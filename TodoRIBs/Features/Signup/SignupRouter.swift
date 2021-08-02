//
//  SignupRouter.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/08/02.
//

import RIBs

protocol SignupInteractable: Interactable {
    var router: SignupRouting? { get set }
    var listener: SignupListener? { get set }
}

protocol SignupViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SignupRouter: ViewableRouter<SignupInteractable, SignupViewControllable>, SignupRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SignupInteractable, viewController: SignupViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
