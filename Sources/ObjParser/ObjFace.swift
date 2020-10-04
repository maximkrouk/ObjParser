import Foundation

public struct ObjFace: Equatable, ObjLineParsable {
    static let key: String = "f"
    
    public var vertexIndices: [Int] = []
    public var textureIndices: [Int] = []
    public var normalIndices: [Int] = []
    
    static func parse(from line: String) -> ObjFace? {
        guard var components = getObjLineComponents(for: self, from: line)
        else { return nil }
        
        var output = ObjFace()
        
        func parseIndices(from component: String) {
            var params = component.components(separatedBy: "/")
            extractNextComponent(from: &params).flatMap(Int.init).map {
                output.vertexIndices.append($0)
            }
            
            extractNextComponent(from: &params).flatMap(Int.init).map {
                output.textureIndices.append($0)
            }
            
            extractNextComponent(from: &params).flatMap(Int.init).map {
                output.normalIndices.append($0)
            }
        }
        
        while let component = extractNextComponent(from: &components) {
            parseIndices(from: component)
        }
        
        return output
    }
}
