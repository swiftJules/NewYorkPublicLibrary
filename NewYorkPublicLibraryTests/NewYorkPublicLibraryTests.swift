//
//  NewYorkPublicLibraryTests.swift
//  NewYorkPublicLibraryTests
//
//  Created by Juliana Connors on 3/28/22.
//

import XCTest
@testable import NewYorkPublicLibrary

class NewYorkPublicLibraryTests: XCTestCase {
    
    func testFormatQuery() {
        let query = "Harry Potter"
        
        let requester = NetworkRequest()
        let formattedQuery = requester.formatQuery(query: query)
        
        XCTAssertEqual(formattedQuery, "harry+potter")
    }
}
