import XCTest
@testable import ObjParser

final class ObjParserTests: XCTestCase {
    func testExample() {
        let objModel = ObjModel.parse(from: objString)
        XCTAssertEqual(objModel?.vertices.count, 1258)
        XCTAssertEqual(objModel?.vertexNormals.count, 1258)
        XCTAssertEqual(objModel?.vertexTextures.count, 1339)
        XCTAssertEqual(objModel?.faces.count, 2492)
        XCTAssertEqual(
            objModel?.faces.first,
            ObjFace(
                vertexIndices: [24, 25, 26],
                textureIndices: [1, 2, 3],
                normalIndices: [24, 25, 26]
            )
        )
    }
}
