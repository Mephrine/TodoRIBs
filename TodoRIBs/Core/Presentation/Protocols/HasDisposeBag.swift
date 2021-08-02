//
//  HasDisposeBag.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/27.
//

import RxSwift

protocol HasDisposeBag {
  var disposeBag: DisposeBag { get set }
}
