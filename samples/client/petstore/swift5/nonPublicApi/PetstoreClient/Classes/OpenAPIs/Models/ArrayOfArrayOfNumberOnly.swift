//
// ArrayOfArrayOfNumberOnly.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

internal struct ArrayOfArrayOfNumberOnly: Codable {

    internal var arrayArrayNumber: [[Double]]?

    internal init(arrayArrayNumber: [[Double]]?) {
        self.arrayArrayNumber = arrayArrayNumber
    }

    internal enum CodingKeys: String, CodingKey, CaseIterable {
        case arrayArrayNumber = "ArrayArrayNumber"
    }

}
