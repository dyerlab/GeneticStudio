import Cocoa

var str = "Hello, playground"

let p = [0.25, 0.25, 0.50]
print(p)
print( p.reduce(0.0, +) )
print( p.map {$0*$0} )
