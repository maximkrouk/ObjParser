public struct ObjVertex: ObjLineParsable {
    static let key: String = "v"
    
    public init(x: Double, y: Double, z: Double, w: Double = 1) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    public var x, y, z: Double
    public var w: Double = 1
    
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
