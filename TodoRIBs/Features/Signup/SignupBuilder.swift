//
//  SignupBuilder.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/08/02.
//

import RIBs

protocol SignupDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SignupComponent: Component<SignupDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SignupBuildable: Buildable {
    func build(withListener listener: SignupListener) -> SignupRouting
}

final class SignupBuilder: Builder<SignupDependency>, SignupBuildable {

    override init(dependency: SignupDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SignupListener) -> SignupRouting {
        let component = SignupComponent(dependency: dependency)
        let viewController = SignupViewController()
        let interactor = SignupInteractor(presenter: viewController)
        interactor.listener = listener
        return SignupRouter(interactor: interactor, viewController: viewController)
    }
}
