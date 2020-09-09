import Foundation

public struct ObjVertexTexture: ObjLineParsable {
    static let key: String = "vt"
    
    public init(u: Double, v: Double = 0, w: Double = 0) {
        self.u = u
        self.v = v
        self.w = w
    }
    
    public var u: Double
    public var v: Double = 0
    public var w: Double = 0
    
    public func map<T>(_ transform: (Double, Double, Double) -> T) -> T { transform(u, v, w) }
    
    static func parse(from line: String) -> ObjVertexTexture? {
        guard var components = getObjLineComponents(for: self, from: line)
        else { return nil }
        
        guard let u = extractNextValue(from: &components) else { return nil }
        let v = extractNextValue(from: &components) ?? 0
        let w = extractNextValue(from: &components) ?? 0
        
        return ObjVertexTexture(u: u, v: v, w: w)
    }
}
