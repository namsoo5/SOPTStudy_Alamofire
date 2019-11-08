//
//  MemoResult.swift
//  study_Alamofire
//
//  Created by 남수김 on 2019/11/06.
//  Copyright © 2019 ns. All rights reserved.
//

import Foundation
/*
 {
     "result": 200,
     "data": [
         {
             "id": 1,
             "question_id": 1,
             "userid": "1",
             "time": "2019-05-13 12:37:43",
             "content": "내용테스트"
         },
         {
             "id": 2,
             "question_id": 2,
             "userid": "user1",
             "time": "2019-10-27 09:33:10",
             "content": "content2"
         }
     ]
 }
 */
struct MemoResult: Codable{
    let result: Int
    let data: [MemoData]
    
    struct MemoData: Codable{
        let id: Int
        let questionId: Int
        let userid: String
        let time: String
        let content: String
        
        enum CodingKeys: String, CodingKey{
            case id
            case questionId = "question_id"
            case userid, time, content
        }
    }
}
