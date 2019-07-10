//
//  ViewController.swift
//  testImageAlignment
//
//  Created by Guntis on 09/07/2019.
//

import UIKit

struct DataObject: Equatable {
	var title: String
	var description: String
	var imageColor: UIColor
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!
	var data = [[DataObject]]() 
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		data.append(
			[
				DataObject.init(title: "Title1", description: "Description1", imageColor: UIColor.red),
				DataObject.init(title: "Title2", description: "Description2", imageColor: UIColor.blue),
				DataObject.init(title: "Title3", description: "Description3", imageColor: UIColor.green),
				DataObject.init(title: "Title4", description: "Description4", imageColor: UIColor.brown)
			])
			
		data.append(
			[
				DataObject.init(title: "Title5", description: "Description5", imageColor: UIColor.red)
			])
		
		tableView.delegate = self
    	tableView.dataSource = self
		tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    	let nib = UINib.init(nibName: "KazooTableViewCell", bundle: nil)
    	tableView.register(nib, forCellReuseIdentifier: "cell")
	}

	// MARK: Table view
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data[section].count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if let cell = tableView.dequeueReusableCell(
		   withIdentifier: "cell",
		   for: indexPath
		) as? KazooTableViewCell {
		
			let aData = self.data[indexPath.section][indexPath.row]
			
			cell.titleLabel.text = aData.title
			cell.descriptionLabel.text = aData.description
			cell.iconImageView.backgroundColor = aData.imageColor
			
			cell.selectionStyle = .none
				
			if self.data[indexPath.section].count == 1 {
				cell.setAsCellType(cellType: .single)
			} else {
				if self.data[indexPath.section].first == aData {
					cell.setAsCellType(cellType: .top)
				} else if self.data[indexPath.section].last == aData {
					cell.setAsCellType(cellType: .bottom)
				} else {
					cell.setAsCellType(cellType: .middle)
				}
			}
			return cell
		} else {
			// Problem
			return UITableViewCell.init()
		}
	}

}

