//
//  BaseViewController.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/26.
//

import RxSwift
import RxCocoa

class BaseViewController: UIViewController,
                          HasSetupConstraints,
                          HasDisposeBag {
  // MARK: - Properties
  var disposeBag = DisposeBag()
  private(set) var didSetupConstraints: Bool = false
  
  private let detachAction = PublishRelay<Void>()
  
  // MARK: - Init & Deinit
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    log.v("Deinit : \(type(of: self))")
  }
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.setNeedsUpdateConstraints()
    setupUI()
    bindUI()
  }
  
  //MARK: - Layout
  override func updateViewConstraints() {
    setupConstraintsIfNeeded()
    super.updateViewConstraints()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    guard isMovingFromParent || isBeingDismissed else { return }
    detachAction.accept(Void())
  }
  
  // MARK: - Inheritance
  func setupUI() {}
  
  func setupConstraints() {}
  
  func bindUI() {}
  
  // MARK: - Private
  func setupConstraintsIfNeeded() {
    guard !didSetupConstraints else  { return }
    setupConstraints()
    didSetupConstraints = true
  }
}
