import Foundation

extension ObjModel {
    
    /// Returns a new ObjModel with 3-vertexed faces only
    public func triangulated() -> ObjModel {
        var output = self
        output.faces = faces.flatMap(triangulated(face:))
        return output
    }
    
    private func triangulated(face: ObjFace) -> [ObjFace] {
        var output = [ObjFace]()
        var (i1, i2) = (1, 2)
        while i2 < face.vertexIndices.count {
            var newFace = face
            newFace.vertexIndices = [face.vertexIndices[0], face.vertexIndices[i1], face.vertexIndices[i2]]
            newFace.normalIndices = [face.normalIndices[0], face.normalIndices[i1], face.normalIndices[i2]]
            newFace.textureIndices = [face.textureIndices[0], face.textureIndices[i1], face.textureIndices[i2]]
            output.append(newFace)
            i1 += 1
            i2 += 1
        }
        return output
    }
    
}
