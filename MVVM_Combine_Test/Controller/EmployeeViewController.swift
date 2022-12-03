//
//  EmployeeViewController.swift
//  MVVM_Combine_Test
//
//  Created by kurupareshan pathmanathan on 11/26/22.
//

import UIKit

class EmployeeViewController: UIViewController {

    //var viewModel: EmployeeViewModel?
    
    public class var storyboardName: String {
        return "Employee"
    }
    
//    static func create(viewModel: EmployeeViewModel) -> EmployeeViewController {
//        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
//        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: EmployeeViewController.self)) as? EmployeeViewController
//        viewController!.viewModel = viewModel
//        return viewController!
//    }
    private var employeeViewModel : EmployeeViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        //tableView.register(EmployeeTableViewCell.self)
        tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
        //tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "EmployeeTableViewCell")
        callToViewModelForUIUpdate()
        getValuesOfModel()
    }
    
    func callToViewModelForUIUpdate(){
        self.employeeViewModel!.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    
    func getValuesOfModel() {
        print("my name is", self.employeeViewModel?.myName)
    }

}

extension EmployeeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.employeeViewModel?.empData.count ?? 0
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EmployeeTableViewCell.self), for: indexPath) as! EmployeeTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        let data = self.employeeViewModel?.empData[indexPath.row]
        cell.setupView(login: data!.login, id: data!.id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
