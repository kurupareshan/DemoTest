//
//  EmployeeViewModel.swift
//  MVVM_Combine_Test
//
//  Created by kurupareshan pathmanathan on 11/26/22.
//

import Foundation

class EmployeeViewModel: NSObject {
    
    private(set) var empData : EmployeesData! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    private(set) var myName : String! {
        didSet {
            self.controllerForString()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    var controllerForString : (() -> ()) = {}
    
    private let sourcesURL = URL(string: "https://api.github.com/users/hadley/orgs")!
    
    override init() {
        super.init()
        apiToGetEmployeeData()
        getValues()
    }
    
    func apiToGetEmployeeData(){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(EmployeesData.self, from: data)
                self.empData = empData
            }
        }.resume()
    }
    
    func getValues() {
        self.myName = "Kuru"
    }

}
