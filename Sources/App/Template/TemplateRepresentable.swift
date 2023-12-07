//
//  TemplateRepresentable.swift
//
//
//  Created by Erison on 07/12/2023.
//

import Vapor
import SwiftSgml

/// A type that can be rendered to a template.
public protocol TemplateRepresentable {
    func render(_ req: Request) -> Tag
}
