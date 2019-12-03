//
// AdditionalPropertiesClass.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class AdditionalPropertiesClass: JSONEncodable {

    public var mapProperty: [String: String]?
    public var mapOfMapProperty: [String: [String: String]]?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String: Any?]()
        nillableDictionary["map_property"] = self.mapProperty?.encodeToJSON()
        nillableDictionary["map_of_map_property"] = self.mapOfMapProperty?.encodeToJSON()

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
