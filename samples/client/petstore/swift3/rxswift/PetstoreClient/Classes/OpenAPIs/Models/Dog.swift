//
// Dog.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class Dog: Animal {

    public var breed: String?

    // MARK: JSONEncodable
    override open func encodeToJSON() -> Any {
        var nillableDictionary = super.encodeToJSON() as? [String: Any?] ?? [String: Any?]()
        nillableDictionary["breed"] = self.breed

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
