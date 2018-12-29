//
//  Protocols.swift
//  StashChallenge
//
//  Created by Felix Changoo on 12/27/18.
//  Copyright © 2018 Felix Changoo. All rights reserved.
//

import UIKit

protocol JSONDecoderProtocol {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}
