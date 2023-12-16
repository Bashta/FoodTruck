//
//  FormComponentBuilder.swift
//
//
//  Created by Erison on 16/12/2023.
//

@resultBuilder

public enum FormComponentBuilder {
    public static func buildBlock(_ components: FormComponent...) -> [FormComponent] {
        components
    }
}
