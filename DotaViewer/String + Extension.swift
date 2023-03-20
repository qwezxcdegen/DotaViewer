//
//  String + Extension.swift
//  DotaViewer
//
//  Created by Степан Фоминцев on 20.03.2023.
//

import Foundation
import UIKit

extension String {
    var encodeUrl : String
    {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var decodeUrl : String
    {
        return self.removingPercentEncoding!
    }
}
