//
//  File+ByteBuffer.swift
//
//
//  Created by Erison on 16/12/2023.
//

import Vapor

public extension File {
    var byteBuffer: ByteBuffer { data }
}
