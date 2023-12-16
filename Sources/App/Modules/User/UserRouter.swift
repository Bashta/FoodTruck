//
//  UserRouter.swift
//
//
//  Created by Erison on 14/12/2023.
//

import Vapor

struct UserRouter: RouteCollection {

    let frontendController = UserFrontendController()

    func boot(routes: RoutesBuilder) throws {
        routes.get("sign-in", use: frontendController.signInView)

        routes
            .grouped(UserCredentialsAuthenticator())
            .post("sign-in", use: frontendController.signInAction)

        routes.get("sign-out", use: frontendController.signOut)
    }

}
