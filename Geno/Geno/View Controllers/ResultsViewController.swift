//
//  ResultsViewController.swift
//  Geno
//
//  Created by Rodney Dyer on 6/6/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import WebKit

enum HeaderLevel : String {
    case h1
    case h2
    case h3
    case h4
}

enum ListType : String {
    case ol
    case ul
}



class ResultsViewController: NSViewController {

    @IBOutlet weak var webView: WKWebView!
    
    fileprivate var resultObjects = [String]() {
        didSet {
            self.webView.loadHTMLString( self.results(), baseURL: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        appendHeader("Geno", level: .h1)
        appendParagraph("<i>Population genetic software that doesn't suck</i>")
        
        let levels = ["(c) 2019 R. Dyer", String("\(Date())"), "29 Red Ballons"]
        appendList(levels, type: .ul )
        
        
        
        var table = [[String]]()
        table.append( ["A","B","C"])
        table.append( ["D","E","F"])
        
        appendTable(table, colHeaders: nil, rowHeaders: nil)
        let colHdr = ["First","Second","Thrid"]
        let rowHdr = ["Primary","Secondary"]
        
        appendTable(table, colHeaders: colHdr, rowHeaders: nil)
        appendTable(table, colHeaders: nil, rowHeaders: rowHdr )
        appendTable(table, colHeaders: colHdr, rowHeaders: rowHdr )
        
    }
    
    
    func results() -> String {
        let header = """
<!DOCTYPE html>
<html lang="en-us">
"""
        let head = """
<head>
    <title>Geno</title>
</head>
"""
        
        let footer = """
</html>
"""
        var body = "<body>"
        
        for item in self.resultObjects {
            body += String("\(item)")
        }
        
        
        body += "</body>"
        return header + head + body + footer
    }
    
}


// MARK: - Text Related Appendings

extension ResultsViewController {
    
    /// Appends header to results
    ///
    /// - Parameters:
    /// - _title_: A String contents to the title.
    /// -  _level_: The level HX level of the heading
    func appendHeader(_ title: String, level: HeaderLevel = .h2 ) {
        resultObjects.append( String("<\(level.rawValue)>\(title)</\(level.rawValue)>") )
    }
    
    
    /// Appends paragraph text to the model.
    func appendParagraph(_ contents: String ) {
        resultObjects.append( String("<p>\(contents)</p>") )
    }
    
    
    /// Append ordered or unordered list
    func appendList(_ items: [String], type: ListType = .ul ) {
        var contents = "<\(type.rawValue)>\n"
        for item in items {
            contents += "<li>\(item)</li>\n"
        }
        contents += "</\(type.rawValue)>\n"
        resultObjects.append( contents )
    }
    
    
    /// Append table data
    ///
    func appendTable(_ contents: [[String]], colHeaders: [String]?, rowHeaders: [String]? ) {
        
        var res: String = "<table>\n"
        
        if let hdrs = colHeaders {
            res += "<tr>\n"
            
            if let _ = rowHeaders {
                res += "<td>&nbsp;</td>"
            }
            
            for item in hdrs {
                res += "<th>\(item)</th>"
            }
            res += "</tr>\n"
        }
        
        for i in 0 ..< contents.count {
            let row = contents[i]
            res += "<tr>\n"
            
            if let r = rowHeaders {
                res += "<th>\(r[i])</th>\n"
            }
            
            for item in row {
                res += "<td>\(item)</td>\n"
            }
            res += "</tr>\n"
        }
        
        res += "</table>\n"
        
        resultObjects.append( res )
    }
    
}
