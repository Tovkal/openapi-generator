//
// FormatTest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class FormatTest: JSONEncodable {

    public var integer: Int32?
    public var int32: Int32?
    public var int64: Int64?
    public var number: Double?
    public var float: Float?
    public var double: Double?
    public var string: String?
    public var byte: Data?
    public var binary: URL?
    public var date: ISOFullDate?
    public var dateTime: Date?
    public var uuid: UUID?
    public var password: String?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String: Any?]()
        nillableDictionary["integer"] = self.integer?.encodeToJSON()
        nillableDictionary["int32"] = self.int32?.encodeToJSON()
        nillableDictionary["int64"] = self.int64?.encodeToJSON()
        nillableDictionary["number"] = self.number
        nillableDictionary["float"] = self.float
        nillableDictionary["double"] = self.double
        nillableDictionary["string"] = self.string
        nillableDictionary["byte"] = self.byte?.encodeToJSON()
        nillableDictionary["binary"] = self.binary?.encodeToJSON()
        nillableDictionary["date"] = self.date?.encodeToJSON()
        nillableDictionary["dateTime"] = self.dateTime?.encodeToJSON()
        nillableDictionary["uuid"] = self.uuid?.encodeToJSON()
        nillableDictionary["password"] = self.password

        let dictionary: [String: Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
