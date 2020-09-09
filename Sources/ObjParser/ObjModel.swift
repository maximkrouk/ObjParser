import Foundation

public struct ObjModel {
    public init(vertices: [ObjVertex] = [], vertexTextures: [ObjVertexTexture] = [], vertexNormals: [ObjVertexNormal] = [], polygons: [ObjPolygon] = []) {
        self.vertices = vertices
        self.vertexTextures = vertexTextures
        self.vertexNormals = vertexNormals
        self.polygons = polygons
    }
    
    public var vertices: [ObjVertex] = []
    public var vertexTextures: [ObjVertexTexture] = []
    public var vertexNormals: [ObjVertexNormal] = []
    public var polygons: [ObjPolygon] = []
    
    public static func parse(from string: String) -> ObjModel? {
        var output = ObjModel()
        
        let parsers: [ObjLineParsable.Type] = [
            ObjVertex.self,
            ObjVertexTexture.self,
            ObjVertexNormal.self,
            ObjPolygon.self
        ]
        
        let lines = getObjComponentLines(from: string, expectedKeys: parsers.map { $0.key })
        
        func append(_ object: ObjLineParsable) {
            if let vertex = object as? ObjVertex {
                output.vertices.append(vertex)
                
            } else if let texture = object as? ObjVertexTexture {
                output.vertexTextures.append(texture)
                
            } else if let normal = object as? ObjVertexNormal {
                output.vertexNormals.append(normal)
                
            } else if let polygon = object as? ObjPolygon {
                output.polygons.append(polygon)
            }
        }
        
        lines.forEach { line in
            for parser in parsers {
                guard let object = parser.parse(from: line) else { continue }
                append(object)
                break
            }
        }
        
        return output
    }
}
