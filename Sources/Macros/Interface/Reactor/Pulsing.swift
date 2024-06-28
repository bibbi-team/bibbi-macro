//
//  File.swift
//  
//
//  Created by 김건우 on 6/28/24.
//

/// State 구조체의 모든 멤버에 @Pulse 프로퍼티 래퍼를 전개합니다.
///
/// ```swift
/// @Pulsing
/// struct State {
///     var name: String
///     @NoPulse var dayOfBirth: String
/// }
/// // Begin expansion of "@Pulsing"
/// struct State {
///     @Pulse var name: String
///     var dayOfBirth: String
/// }
/// ```
///
/// 만약 특정 프로퍼티에 @Pulse 프로퍼티 래퍼를 전개시키고 싶지 않다면 @NoPulse 매크로를 적용하면 됩니다.
///
/// - Warning: 이 매크로는  State라는 이름을 가진 구조체에만 적용할 수 있습니다. (ReactorKit 전용)
/// - Author: 김소월
///
@attached(memberAttribute)
public macro Pulsing() = #externalMacro(
    module: "MacrosImplementation",
    type: "PulsingMacro"
)
