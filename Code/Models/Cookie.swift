import SpriteKit

// MARK: - CookieType

enum CookieType: Int, CustomStringConvertible {
  case unknown = 0, cow, crab, elephant, giraffe, mouse, turtle
  
  var spriteName: String {
    let spriteNames = [
      "Cow",
      "Crab",
      "Elephant",
      "Giraffe",
      "Mouse",
      "Turtle"]
    
    return spriteNames[rawValue - 1]
  }
  
  var highlightedSpriteName: String {
    return spriteName + "-Highlighted"
  }
  
  var description: String {
    return spriteName
  }
  
  static func random() -> CookieType {
    return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
  }
}


// MARK: - Cookie

func ==(lhs: Cookie, rhs: Cookie) -> Bool {
  return lhs.column == rhs.column && lhs.row == rhs.row
}

class Cookie: CustomStringConvertible, Hashable {
  
  var column: Int
  var row: Int
  let cookieType: CookieType
  var sprite: SKSpriteNode?
  
  init(column: Int, row: Int, cookieType: CookieType) {
    self.column = column
    self.row = row
    self.cookieType = cookieType
  }
  
  var description: String {
    return "type:\(cookieType) square:(\(column),\(row))"
  }
  
  var hashValue: Int {
    return row*10 + column
  }
  
}
