//
//  File.swift
//  
//
//  Created by 김건우 on 6/28/24.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import MacrosImplementation
import XCTest

fileprivate let testMacros: [String: Macro.Type] = [
    "Pulsing": PulsingMacro.self,
    "NoPulse": NoPulseMacro.self
]

final class PulsingMacroTest: XCTestCase {
    
    func testPulsingMacro() {
        
        assertMacroExpansion(
            """
            @Pulsing
            struct State {
                var name: String
                @NoPulse var age: Int
            }
            """,
            expandedSource:
            """
            struct State {
                @Pulse
                var name: String
                var age: Int
            }
            """,
            macros: testMacros
        )
        
    }
    
    func testPulsingMacroWithError() {
        
        assertMacroExpansion(
            """
            @Pulsing
            enum Action {
                case didTapActionButton
            }
            """,
            expandedSource:
            """
            enum Action {
                case didTapActionButton
            }
            """,
            diagnostics: [
                DiagnosticSpec(
                    message: "이 매크로는 State 구조체에만 적용할 수 있습니다.",
                    line: 1,
                    column: 1
                )
            ],
            macros: testMacros
        )
        
    }
    
    func testNoPulseMacroWithError() {
        
        assertMacroExpansion(
            """
            @Pulsing
            struct State {
                @NoPulse var name: String { "김소월" }
            }
            """,
            expandedSource:
            """
            struct State {
                var name: String { "김소월" }
            }
            """,
            diagnostics: [
                DiagnosticSpec(
                    message: "이 매크로는 저장 프로퍼티에만 적용할 수 있습니다.",
                    line: 3,
                    column: 5
                )
            ],
            macros: testMacros
        )
        
    }
    
}
