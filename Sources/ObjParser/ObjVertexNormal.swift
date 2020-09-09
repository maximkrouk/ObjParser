import Foundation

public struct ObjVertexNormal: ObjLineParsable {
    static let key: String = "vn"
    
    public init(i: Double, j: Double, k: Double) {
        self.i = i
        self.j = j
        self.k = k
    }
    
    public var i, j, k: Double
    
    static func parse(from line: String) -> ObjVertexNormal? {
        guard var components = getObjLineComponents(for: self, from: line)
        else { return nil }
        
        guard
            let i = extractNextValue(from: &components),
            let j = extractNextValue(from: &components),
            let k = extractNextValue(from: &components)
        else { return nil}
        
        return ObjVertexNormal(i: i, j: j, k: k)
    }
    
}
