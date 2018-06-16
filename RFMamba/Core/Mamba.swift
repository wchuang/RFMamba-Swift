//
//  Mamda.swift
//  RFMamda
//
//  Created by roy.cao on 2018/5/17.
//  Copyright © 2018年 RFMamba. All rights reserved.
//

import Foundation
import UIKit

public final class Mamba<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}


public protocol MambaCompatible {
    associatedtype CompatibleType
    var rf: CompatibleType { get }
}

public extension MambaCompatible {
    public var rf: Mamba<Self> {
        get { return Mamba(self) }
    }
}

extension UIImage: MambaCompatible { }
extension UIImageView: MambaCompatible { }
extension UIButton: MambaCompatible { }
extension String: MambaCompatible { }
