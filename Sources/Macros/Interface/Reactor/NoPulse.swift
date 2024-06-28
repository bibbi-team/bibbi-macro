//
//  File.swift
//  
//
//  Created by 김건우 on 6/28/24.
//

/// 이 프로퍼티에는 @Pulsing 매크로가 @Pulse 프로퍼티 래퍼를 전개시키지 않도록 합니다.
///
/// - Author: 김소월
///
@attached(peer)
public macro NoPulse() = #externalMacro(
    module: "MacrosImplementation",
    type: "NoPulseMacro"
)
