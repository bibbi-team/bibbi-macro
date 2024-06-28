//
//  File.swift
//  
//
//  Created by 김건우 on 6/28/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct NoPulseMacro: PeerMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        guard
            let varDecl = declaration.as(VariableDeclSyntax.self),
            varDecl.isStoredProperty
        else {
            throw MacroError.message("이 매크로는 저장 프로퍼티에만 적용할 수 있습니다.")
        }
        
        return []
    }
    
}
