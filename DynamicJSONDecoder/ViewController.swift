//
//  ViewController.swift
//  DynamicJSONDecoder
//
//  Created by 韦儒健 on 2020/6/9.
//  Copyright © 2020 WeiRuJian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        verifiedJSONDecoder()
    }
    
    
    func verifiedJSONDecoder() {
        let json = """
        {
          "S001": {
            "firstName": "Tony",
            "lastName": "Stark"
          },
          "S002": {
            "firstName": "Peter",
            "lastName": "Parker"
          },
          "S003": {
            "firstName": "Bruce",
            "lastName": "Wayne"
          }
        }
        """.data(using: .utf8)!
        
        do {
            let m = try JSONDecoder().decode(DynamicCoding<Student>.self, from: json)
            print(m.array)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct Student: Codable {
    let firstName: String
    let lastName: String
    let studentID: String
    
    enum CodingKeys: CodingKey {
        case firstName
        case lastName
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: CodingKeys.firstName)
        lastName = try container.decode(String.self, forKey: CodingKeys.lastName)
        studentID = container.codingPath.first!.stringValue
    }
}

func verifiedJSONDecoder() {
    let json = """
    {
      "S001": {
        "firstName": "Tony",
        "lastName": "Stark"
      },
      "S002": {
        "firstName": "Peter",
        "lastName": "Parker"
      },
      "S003": {
        "firstName": "Bruce",
        "lastName": "Wayne"
      }
    }
    """.data(using: .utf8)!
    
    do {
        let m = try JSONDecoder().decode(DynamicCoding<Student>.self, from: json)
        print(m.array)
    } catch {
        print(error.localizedDescription)
    }
}
