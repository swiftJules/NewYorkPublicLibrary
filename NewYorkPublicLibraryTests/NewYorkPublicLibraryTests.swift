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
        
        let networkRequester = NetworkRequest()
        let formattedQuery = networkRequester.formatQuery(query: query)
        
        XCTAssertEqual(formattedQuery, "harry+potter")
    }
}
