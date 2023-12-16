//
//  HiddenFieldContext.swift
//
//
//  Created by Erison on 16/12/2023.
//

public struct HiddenFieldContext {

    public let key: String
    public var value: String?

    public init(key: String, value: String? = nil) {
        self.key = key
        self.value = value
    }

}
