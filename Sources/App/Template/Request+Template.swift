//
//  Request+Template.swift
//
//
//  Created by Erison on 07/12/2023.
//

import Vapor

public extension Request {
    var templates: TemplateRenderer { .init(self) }
}
