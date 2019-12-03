//
// Cat.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class Cat: Animal {

    public var declawed: Bool?
    public var declawedNum: NSNumber? {
        get {
            return declawed.map({ return NSNumber(value: $0) })
        }
    }

    // MARK: JSONEncodable
    override open func encodeToJSON() -> Any {
        var nillableDictionary = super.encodeToJSON() as? [String: Any?] ?? [String: Any?]()
        nillableDictionary["declawed"] = self.declawed

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
