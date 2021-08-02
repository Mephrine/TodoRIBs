//
//  SignupViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/08/02.
//

import RIBs
import RxSwift
import UIKit

protocol SignupPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SignupViewController: UIViewController, SignupPresentable, SignupViewControllable {

    weak var listener: SignupPresentableListener?
}
