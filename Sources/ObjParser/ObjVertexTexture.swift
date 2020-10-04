import Foundation
import simd

public struct ObjVertexTexture: Equatable, RawRepresentable, ObjLineParsable {
    static let key: String = "vt"
    
    public init(u: Float, v: Float = 0, w: Float = 0) {
        self.init(rawValue: .init(u, v, w))
    }
    
    public init(rawValue: simd_float3) {
        self.rawValue = rawValue
    }
    
    public var rawValue: simd_float3
    
    static func parse(from line: String) -> ObjVertexTexture? {
        guard var components = getObjLineComponents(for: self, from: line)
        else { return nil }
        
        guard let u = extractNextValue(from: &components) else { return nil }
        let v = extractNextValue(from: &components) ?? 0
        let w = extractNextValue(from: &components) ?? 0
        
        return ObjVertexTexture(u: u, v: v, w: w)
    }
}

extension ObjVertexNormal {
    public var u: Float {
        get { rawValue.x }
        set { rawValue.x = newValue }
    }
    
    public var v: Float {
        get { rawValue.y }
        set { rawValue.y = newValue }
    }
    
    public var w: Float {
        get { rawValue.z }
        set { rawValue.z = newValue }
    }
}
