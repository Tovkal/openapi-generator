//
// OuterComposite.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class OuterComposite: JSONEncodable {

    public var myNumber: Double?
    public var myNumberNum: NSNumber? {
        get {
            return myNumber.map({ return NSNumber(value: $0) })
        }
    }
    public var myString: String?
    public var myBoolean: Bool?
    public var myBooleanNum: NSNumber? {
        get {
            return myBoolean.map({ return NSNumber(value: $0) })
        }
    }

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String: Any?]()
        nillableDictionary["my_number"] = self.myNumber
        nillableDictionary["my_string"] = self.myString
        nillableDictionary["my_boolean"] = self.myBoolean

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
