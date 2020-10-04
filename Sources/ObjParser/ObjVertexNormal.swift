import Foundation
import simd

public struct ObjVertexNormal: Equatable, RawRepresentable, ObjLineParsable {
    static let key: String = "vn"
    
    public init(i: Float, j: Float, k: Float) {
        self.init(rawValue: .init(i, j, k))
    }
    
    public init(rawValue: simd_float3) {
        self.rawValue = rawValue
    }
    
    public var rawValue: simd_float3
    
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

extension ObjVertexNormal {
    public var i: Float {
        get { rawValue.x }
        set { rawValue.x = newValue }
    }
    
    public var j: Float {
        get { rawValue.y }
        set { rawValue.y = newValue }
    }
    
    public var k: Float {
        get { rawValue.z }
        set { rawValue.z = newValue }
    }
}
