import Foundation

protocol ObjLineParsable {
    static var key: String { get }
    static func parse(from line: String) -> Self?
}

func getObjComponentLines(from string: String, expectedKeys: [String]) -> [String] {
    func isNotExpected(_ component: String) -> Bool {
        expectedKeys.first(where: { component.hasPrefix($0) }) != nil
    }
    
    return Array(
        string
            .components(separatedBy: .newlines)
            .drop(while: isNotExpected(_:))
            .reversed()
            .drop(while: isNotExpected(_:))
            .reversed()
    )
}

func getObjLineComponents<T: ObjLineParsable>(for type: T.Type, from line: String) -> [String]? {
    let line = line.lowercased()
    guard line.hasPrefix(type.key) else { return nil }
    let components = line
        .trimmingCharacters(in: .whitespaces)
        .components(separatedBy: .whitespaces)
        
    guard components.first == type.key else { return nil }
    return Array(components.dropFirst().filter(\.isEmpty))
}

func extractNextComponent(from components: inout [String]) -> String? {
    guard let value = components.first
    else { return nil }
    
    components.removeFirst()
    return value
}

func extractNextValue(from components: inout [String]) -> Double? {
    extractNextComponent(from: &components).flatMap(Double.init)
}
