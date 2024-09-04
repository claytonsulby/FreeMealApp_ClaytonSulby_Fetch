//
//  FreeMealApp_ClaytonSulby_FetchTests.swift
//  FreeMealApp-ClaytonSulby-FetchTests
//
//  Created by Clayton Sulby on 9/4/24.
//

import XCTest
@testable import FreeMealApp_ClaytonSulby_Fetch

final class FreeMealApp_ClaytonSulby_FetchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetFilter() async throws {
        let result = try await FreeMealAPI.getFilter(filter: "Dessert")
        XCTAssertNotEqual(result, FilterResponse())
    }
    
    func testGetLookup() async throws {
        let result = try await FreeMealAPI.getLookup(id: 52929)
        XCTAssertNotEqual(result, LookupResponse())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
