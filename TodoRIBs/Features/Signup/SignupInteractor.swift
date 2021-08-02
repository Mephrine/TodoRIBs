//
//  SignupInteractor.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/08/02.
//

import RIBs
import RxSwift

protocol SignupRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SignupPresentable: Presentable {
    var listener: SignupPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SignupListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SignupInteractor: PresentableInteractor<SignupPresentable>, SignupInteractable, SignupPresentableListener {

    weak var router: SignupRouting?
    weak var listener: SignupListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SignupPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
