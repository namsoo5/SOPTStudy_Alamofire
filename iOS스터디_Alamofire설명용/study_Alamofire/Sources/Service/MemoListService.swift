//
//  MemoListService.swift
//  study_Alamofire
//
//  Created by 남수김 on 2019/11/06.
//  Copyright © 2019 ns. All rights reserved.
//

import Foundation
import Alamofire

enum NetWorkResult<T, Error>{
    
    case success(T)
    case failure(Error)
    
}
class MemoListService{
    
    private init() {}
    
    static let shared = MemoListService()
    
    func getMemoList(completion: @escaping (NetWorkResult<[MemoResult.MemoData], Error>) -> Void){
        
        let url = iOSAPI.memoList
        
        Alamofire.request(url).responseJSON{
            response in
            
            switch response.result{
            case .success:
                
                guard let data = response.data else {return}
                
                do{
                    let decoder = JSONDecoder()
                    
                    let object = try decoder.decode(MemoResult.self, from: data)
                    
                    if object.result == 200{
                        print("성공")
                        completion(.success(object.data))
                    }else {
                        completion(.failure(fatalError("서버이상")))
                    }
                    
                }catch(let err){
                    print(err.localizedDescription)
                    completion(.failure(err))
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
