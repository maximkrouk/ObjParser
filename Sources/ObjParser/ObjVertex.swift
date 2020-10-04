import simd

@dynamicMemberLookup
public struct ObjVertex: Equatable, RawRepresentable, ObjLineParsable {
    static let key: String = "v"
    
    public init(x: Float, y: Float, z: Float, w: Float = 1) {
        self.init(rawValue: .init(x, y, z, w))
    }
    
    public init(rawValue: simd_float4) {
        self.rawValue = rawValue
    }
    
    public var rawValue: simd_float4
    
    public subscript<T>(dynamicMember keyPath: WritableKeyPath<simd_float4, T>) -> T {
        get { rawValue[keyPath: keyPath] }
        set { rawValue[keyPath: keyPath] = newValue }
    }
    
    static func parse(from line: String) -> ObjVertex? {
        guard var components = getObjLineComponents(for: self, from: line)
        else { return nil }
        
        guard
            let x = extractNextValue(from: &components),
            let y = extractNextValue(from: &components),
            let z = extractNextValue(from: &components)
        else { return nil }
        
        let w = extractNextValue(from: &components) ?? 1
        
        return ObjVertex(x: x, y: y, z: z, w: w)
    }
}
