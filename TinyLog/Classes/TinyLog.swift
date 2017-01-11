//
//  TinyLog.swift
//  TinyLog
//
//  Created by DragonCherry on 1/11/17.
//  Copyright © 2017 DragonCherry. All rights reserved.
//

import Foundation

fileprivate class TinyLogDateFormatter {
    // MARK: Singleton
    fileprivate static let `default`: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()
}

fileprivate func fileName(_ filePath: String) -> String {
    let lastPathComponent = NSString(string: filePath).lastPathComponent
    if let name = lastPathComponent.components(separatedBy: ".").first {
        return name
    } else {
        return lastPathComponent
    }
}
public func log(_ msg: @autoclosure () -> Any, _ prefix: String = "⚫", _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        print("\(TinyLogDateFormatter.default.string(from: Date())) \(prefix)\(fileName(file)).\(function):\(line) - \(msg())")
    #endif
}
public func logi(_ msg: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💙", file, function, line)
}
public func logv(_ msg: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "⚫", file, function, line) // I put a black circle instead of black heart since it's available from iOS 10.2.
}
public func logd(_ msg: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💚", file, function, line)
}
public func logw(_ msg: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💛", file, function, line)
}
public func loge(_ msg: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "❤️", file, function, line)
}
public func logc(_ msg: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💔", file, function, line)
}
