//
//  DemoURLs.swift
//  JSON2Table
//
//  Created by Stanislav on 28.03.2019.
//  Copyright © 2019 Stanislav Kozlov. All rights reserved.
//

import Foundation

struct DemoURLs {
    static let jsonFile: [URL] = [Bundle.main.url(forResource: "document", withExtension: "json")!,
                                  Bundle.main.url(forResource: "document_bigcontent", withExtension: "json")!,
                                  Bundle.main.url(forResource: "document_invalid", withExtension: "json")!]
}
