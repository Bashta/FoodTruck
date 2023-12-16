//
//  UserMigrations.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Vapor
import Fluent

enum UserMigrations {
    struct V1: AsyncMigration {
        func prepare(on db: Database) async throws {
            try await db.schema(UserAccountModel.schema)
                .id()
                .field(UserAccountModel.FieldKeys.V1.email, .string, .required)
                .field(UserAccountModel.FieldKeys.V1.password, .string, .required)
                .unique(on: UserAccountModel.FieldKeys.V1.email)
                .create()
        }
        func revert(on db: Database) async throws {
            try await db.schema(UserAccountModel.schema).delete()
        }
    }
    struct Seed: AsyncMigration {
        func prepare(on db: Database) async throws {
            let email = "root@localhost.com"
            let password = "ChangeMe1"
            let user = UserAccountModel(
                email: email,
                password: try Bcrypt.hash(password)
            )
            try await user.create(on: db)
        }
        func revert(on db: Database) async throws {
            try await UserAccountModel.query(on: db).delete()
        }
    }
}
