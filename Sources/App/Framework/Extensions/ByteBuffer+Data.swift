//
//  ByteBuffer+Data.swift
//
//
//  Created by Erison on 16/12/2023.
//

import Vapor

public extension ByteBuffer {
    var data: Data? {
        getData(at: 0, length: readableBytes)
    }
}
