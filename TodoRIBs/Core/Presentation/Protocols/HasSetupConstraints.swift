//
//  HasSetupConstraints.swift
//  TodoRIBs
//
//  Created by Mephrine on 2021/07/27.
//

import Foundation

protocol HasSetupConstraints {
  var didSetupConstraints: Bool { get }
  func setupConstraints()
}
