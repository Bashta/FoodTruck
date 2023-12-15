//
//  UserAccountModel.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Vapor
import Fluent

final class UserAccountModel: DatabaseModelInterface {

    typealias Module = UserModule

    struct FieldKeys {
        struct V1 {
            static var email: FieldKey { "email" }
            static var password: FieldKey { "password" }
        }
    }

    @ID()
    var id: UUID?

    @Field(key: FieldKeys.V1.email)
    var email: String

    @Field(key: FieldKeys.V1.password)
    var password: String

    init() { }

    init(
        id: UUID? = nil,
        email: String,
        password: String
    ) {
        self.id = id
        self.email = email
        self.password = password
    }
}
