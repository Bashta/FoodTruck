//
//  AsyncValidatorBuilder.swift
//
//
//  Created by Erison on 16/12/2023.
//

@resultBuilder
public enum AsyncValidatorBuilder {
    public static func buildBlock(_ components: AsyncValidator...) -> [AsyncValidator] {
        components
    }
}
