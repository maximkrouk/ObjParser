import XCTest
@testable import ObjParser

final class ObjParserTests: XCTestCase {
    func testExample() {
        let objModel = ObjModel.parse(from: objString)
        dump(objModel)
        XCTAssert(objModel != nil)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
