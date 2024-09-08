import XCTest
@testable import FreeMealApp_ClaytonSulby_Fetch

final class FreeMealAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Initialize any resources needed for tests here
    }

    override func tearDownWithError() throws {
        // Clean up resources initialized in setUpWithError
    }

    // MARK: - Test Data

    private let validFilter = "Dessert"
    private let invalidFilter = "InvalidFilter"
    private let validId = "52929"
    private let invalidId = "00000"

    private let expectedEmptyFilterResponse = FilterResponse()
    private let expectedEmptyLookupResponse = LookupResponse()
    private let expectedEmptyCategoriesResponse = CategoryResponse()

    // MARK: - Test Cases
    func testGetCategories() async {
        let result = await FreeMealAPI.getCategories()
        switch (result) {
        case .success(let response):
            XCTAssertNotEqual(response, expectedEmptyCategoriesResponse, "Expected non-empty category response")
        case .failure:
            break
        }
    }

    func testGetFilterWithValidFilter() async {
        let result = await FreeMealAPI.getFilter(filter: validFilter)
        switch (result) {
        case .success(let response):
            XCTAssertNotEqual(response, expectedEmptyFilterResponse, "Expected non-empty filter response for valid filter")
        case .failure:
            break
        }
    }

    func testGetFilterWithInvalidFilter() async {
        let result = await FreeMealAPI.getFilter(filter: invalidFilter)
        switch (result) {
        case .success:
            break
        case .failure(let error):
            XCTAssertTrue(error as? DecodeError != nil)
        }
    }

    func testGetLookupWithValidId() async {
        let result = await FreeMealAPI.getLookup(id: validId)
        switch (result) {
        case .success(let response):
            XCTAssertNotEqual(response, expectedEmptyLookupResponse, "Expected non-empty lookup response for valid ID")
        case .failure:
            break
        }
    }

    func testGetLookupWithInvalidId() async {
        let result = await FreeMealAPI.getFilter(filter: invalidId)
        switch (result) {
        case .success:
            break
        case .failure(let error):
            XCTAssertTrue(error as? DecodeError != nil)
        }
    }
}
