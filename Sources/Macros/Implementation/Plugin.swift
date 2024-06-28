//
//  File.swift
//  
//
//  Created by 김건우 on 5/9/24.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct Bibbi_MacroPlugin: CompilerPlugin {
    var providingMacros: [Macro.Type] = [
        DependencyValueMacro.self,
        CodableKeyMacro.self,
        CodableMacro.self,
        WrapperMacro.self,
        WrapperViewMacro.self,
        URLMacro.self,
        DependencyOrganizerMacro.self,
        DeprecatedMacro.self,
        NoPulseMacro.self,
        PulsingMacro.self
    ]
}
