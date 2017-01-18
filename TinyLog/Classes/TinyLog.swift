//
//  TinyLog.swift
//  TinyLog
//
//  Created by DragonCherry on 1/11/17.
//  Copyright © 2017 DragonCherry. All rights reserved.
//

import Foundation

public class TinyLog {
    public static var stripParameters: Bool = true
}

internal class TinyLogDateFormatter {
    // MARK: Singleton
    static let current: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()
}

internal func fileName(_ filePath: String) -> String {
    let lastPathComponent = NSString(string: filePath).lastPathComponent
    
    if let name = lastPathComponent.componentsSeparatedByString(".").first {
        return name
    } else {
        return lastPathComponent
    }
}

internal func functionNameByStrippingParameters(_ function: String) -> String {
    
    if let startIndex = function.characters.indexOf("(") {
        return function.substringToIndex(startIndex)
    } else {
        return function
    }
}

public func log(@autoclosure _ msg: () -> AnyObject, _ prefix: String = "⚫", _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        print("\(TinyLogDateFormatter.current.stringFromDate(NSDate())) \(prefix)\(fileName(file)).\(TinyLog.stripParameters ? functionNameByStrippingParameters(function) : function):\(line) - \(msg())")
    #endif
}

public func logi(@autoclosure _ msg: () -> AnyObject, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💙", file, function, line)
}

public func logv(@autoclosure _ msg: () -> AnyObject, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "⚫", file, function, line) // I put a black circle instead of black heart since it's available from iOS 10.2.
}

public func logd(@autoclosure _ msg: () -> AnyObject, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💚", file, function, line)
}

public func logw(@autoclosure _ msg: () -> AnyObject, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💛", file, function, line)
}

public func loge(@autoclosure _ msg: () -> AnyObject, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "❤️", file, function, line)
}

public func logc(@autoclosure _ msg: () -> AnyObject, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    log(msg, "💔", file, function, line)
}
