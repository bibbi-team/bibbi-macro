//
//  File.swift
//  
//
//  Created by 김건우 on 6/28/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct PulsingMacro: MemberAttributeMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingAttributesFor member: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [AttributeSyntax] {
        
        guard
            let structDecl = declaration.as(StructDeclSyntax.self),
            structDecl.name.text == "State"
        else {
            throw MacroError.message("이 매크로는 State 구조체에만 적용할 수 있습니다.")
        }
        
        guard
            let varDecl = member.as(VariableDeclSyntax.self),
            varDecl.isStoredProperty
        else { return [] }
        
        guard
            !varDecl.attributes.isAttributeApplied("NoPulse")
        else { return [] }
        
        return [
            AttributeSyntax(
                attributeName: IdentifierTypeSyntax(
                    name: .identifier("Pulse")
                )
            )
        ]
    }
    
}
