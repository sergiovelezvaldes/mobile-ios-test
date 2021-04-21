//
//  ContainerExtension.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 13/04/21.
//
import Foundation
import Swinject

fileprivate let _defaultContainer = Container()

extension Container {
  public static func defaultContainer() -> Container { return _defaultContainer }
  public static func defaultContainer( _ registeringClosure: (Container) -> Void) -> Container {
    registeringClosure(_defaultContainer)
    return _defaultContainer
  }
}
