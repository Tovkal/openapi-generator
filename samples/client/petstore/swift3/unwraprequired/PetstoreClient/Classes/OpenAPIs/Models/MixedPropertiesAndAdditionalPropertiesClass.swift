//
// MixedPropertiesAndAdditionalPropertiesClass.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class MixedPropertiesAndAdditionalPropertiesClass: JSONEncodable {

    public var uuid: UUID?
    public var dateTime: Date?
    public var map: [String: Animal]?

    public init(uuid: UUID?=nil, dateTime: Date?=nil, map: [String: Animal]?=nil) {
        self.uuid = uuid
        self.dateTime = dateTime
        self.map = map
    }
    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String: Any?]()
        nillableDictionary["uuid"] = self.uuid?.encodeToJSON()
        nillableDictionary["dateTime"] = self.dateTime?.encodeToJSON()
        nillableDictionary["map"] = self.map?.encodeToJSON()

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
