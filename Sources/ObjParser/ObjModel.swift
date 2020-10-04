import Foundation

public struct ObjModel: Equatable {
    public init(vertices: [ObjVertex] = [], vertexTextures: [ObjVertexTexture] = [], vertexNormals: [ObjVertexNormal] = [], faces: [ObjFace] = []) {
        self.vertices = vertices
        self.vertexTextures = vertexTextures
        self.vertexNormals = vertexNormals
        self.faces = faces
    }
    
    public var vertices: [ObjVertex] = []
    public var vertexTextures: [ObjVertexTexture] = []
    public var vertexNormals: [ObjVertexNormal] = []
    public var faces: [ObjFace] = []
    
    public static func parse(from string: String) -> ObjModel? {
        var output = ObjModel()
        
        let parsers: [ObjLineParsable.Type] = [
            ObjVertex.self,
            ObjVertexTexture.self,
            ObjVertexNormal.self,
            ObjFace.self
        ]
        
        let lines = string.components(separatedBy: .newlines)
        
        func append(_ object: ObjLineParsable) {
            if let vertex = object as? ObjVertex {
                output.vertices.append(vertex)
                
            } else if let texture = object as? ObjVertexTexture {
                output.vertexTextures.append(texture)
                
            } else if let normal = object as? ObjVertexNormal {
                output.vertexNormals.append(normal)
                
            } else if let polygon = object as? ObjFace {
                output.faces.append(polygon)
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
