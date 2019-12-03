//
// ClassModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/** Model for testing model with \&quot;_class\&quot; property */
open class ClassModel: JSONEncodable {

    public var _class: String?

    public init(_class: String?=nil) {
        self._class = _class
    }
    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String: Any?]()
        nillableDictionary["_class"] = self._class

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
