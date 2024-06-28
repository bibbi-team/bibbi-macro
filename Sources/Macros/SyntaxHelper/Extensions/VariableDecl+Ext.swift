//
//  File.swift
//  
//
//  Created by 김건우 on 6/1/24.
//

import SwiftSyntax

public extension VariableDeclSyntax {
    
    /// 프로퍼티에 초기값이 있는지 확인합니다.
    ///
    /// - Returns: 초기값이 있으면 true, 없으면 false
    /// - Author: 김소월
    ///
    var hasIntializer: Bool {
        // 라인 하나에 바인딩 하나
        if bindings.count != 1 {
            return false
        }
        
        let binding = bindings.first
        guard
            let _ = binding?.initializer?.value
        else { return true }
        return false
    }
    
    /// 저장 프로퍼티인지 확인합니다.
    ///
    /// - Returns: 저장 프로퍼티라면 true, 아니라면 false
    /// - Author: 김소월
    ///
    var isStoredProperty: Bool {
        // 라인 하나에 바인딩 하나
        if bindings.count != 1 {
            return false
        }
        
        let binding = bindings.first
        switch binding?.accessorBlock?.accessors {
        case .none:
            return true
            
        case let .accessors(accessors):
            for accessor in accessors {
                switch accessor.accessorSpecifier.tokenKind {
                case .keyword(.willSet), .keyword(.didSet):
                    break
                    
                default:
                    return false
                }
            }
            
            return true
            
        case .getter:
            return false
        }
    }
    
}
