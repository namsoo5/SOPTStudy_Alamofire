//
//  ViewController.swift
//  study_Alamofire
//
//  Created by 남수김 on 2019/11/05.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //Cell에 들어갈 데이터저장배열
    typealias MemoData = MemoResult.MemoData
    
    var dataSet = [MemoData]()
    private let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        
        
        self.tableView.refreshControl = refresh
        refresh.addTarget(self, action: #selector(tableViewPullRefresh), for: .valueChanged)
        
//        MemoListService.shared.getMemoList(){
//            resultData in
//
//            switch resultData{
//
//            case .success(let data):
//                self.dataSet = data
//                self.tableView.reloadData()
//            case .failure(let err):
//                print(err.localizedDescription)
//            default:
//                return
//            }
//
//        }
        
    }
    
    
    @objc func tableViewPullRefresh(){
    
        MemoListService.shared.getMemoList(){
            resultData in
            
            switch resultData{
                
            case .success(let data):
                self.dataSet = data
                self.tableView.reloadData()
                self.refresh.endRefreshing()
            case .failure(let err):
                print(err.localizedDescription)
            default:
                return
            }
            
        }
        
    }
    
}

// MARK: - 테이블뷰 설정
extension ViewController: UITableViewDataSource{
    
    //MARK: 셀 개수설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    //MARK: 셀 내용설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataTableViewCell else { return UITableViewCell() }
        
        cell.idLabel.text = "\(dataSet[indexPath.row].id)."
        cell.useridLabel.text = "\(dataSet[indexPath.row].userid)"
        cell.contentTextView.text = "\(dataSet[indexPath.row].content)"
        
        return cell
    }
    
    
}
