//
//  UserLoginForm.swift
//
//
//  Created by Erison on 16/12/2023.
//

import Vapor

final class UserLoginForm: AbstractForm {
    
    public convenience init() {
        let formAction = FormAction(
            method: .post,
            url: "/sign-in/"
        )

        self.init(
            action: formAction,
            submit: "Sign in"
        )

        self.fields = createFields()
    }
    
    @FormComponentBuilder
    func createFields() -> [FormComponent] {
        
        InputField("email")
            .config {
                $0.output.context.label.required = true
                $0.output.context.type = .email
            }
        
        InputField("password")
            .config {
                $0.output.context.label.required = true
                $0.output.context.type = .password
            }
    }
}
