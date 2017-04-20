//
//  RestaurantDetailsViewController.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PromiseKit

class RestaurantDetailsViewController: UIViewController {

    @IBOutlet weak var reviewTableView: UITableView!
    
    let headerView: RestaurantDetailHeaderView = RestaurantDetailHeaderView.initFromNib()
    
    var restaurant: Restaurant!
    var restaurantServices = RestaurantServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = kStringRestaurant
        configureUI()
        loadDataIntoUI()
    }
}

//MARK: - Configures
extension RestaurantDetailsViewController {
    fileprivate func configureUI() {
        showDismissButton()
        configureTableView()
    }
    
    fileprivate func showDismissButton() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: kStringDismiss, style: .plain, target: self, action: #selector(self.didTapToDismissButton))
    }

    fileprivate func configureTableView() {
        //tableview
        reviewTableView.dataSource = self
        reviewTableView.delegate = self
        reviewTableView.register(UINib(nibName: ReviewCell.className, bundle: nil), forCellReuseIdentifier: ReviewCell.className)
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        reviewTableView.tableFooterView = view
        reviewTableView.estimatedRowHeight = 44
        reviewTableView.rowHeight = UITableViewAutomaticDimension
        configureTableViewHeader()
    }
    
    fileprivate func configureTableViewHeader() {
        reviewTableView.tableHeaderView = headerView
        headerView.restaurant = self.restaurant
    }
    
    func didTapToDismissButton() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - Data
extension RestaurantDetailsViewController {
    fileprivate func loadDataIntoUI() {
        callAPIGetReviews()
    }
    
    fileprivate func updateReviewData() {
        self.reviewTableView.reloadData()
        headerView.updateReviews(count: restaurant.reviews.count)
    }
    
    fileprivate func callAPIGetReviews() {
        showLoading()
        firstly { () -> Promise<GetRestaurantReviewsOutput> in
            let input = GetRestaurantReviewsInput(restaurantID: restaurant.id)
            return  restaurantServices.getReviewOfARestaurant(input)
            }.then { [weak self] (output) -> Void in
                self?.updateRestaurantReviews(reviews: output.reviews)
                self?.hideLoading()
            }.catch { [weak self] (error) in
                self?.showErrorAlert(message: error.localizedDescription)
                self?.hideLoading()
        }
    }
    
    fileprivate func updateRestaurantReviews(reviews: [Review]) {
        restaurant.reviews = reviews
        updateReviewData()
    }
}

//MARK: - Table View Datasource
extension RestaurantDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurant.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.className, for: indexPath) as! ReviewCell
        if indexPath.row < restaurant.reviews.count {
            cell.review = restaurant.reviews[indexPath.row]
        } else {
            cell.review = Review()
        }
        return cell
    }
}

//MARK: - Table View Delegate
extension RestaurantDetailsViewController: UITableViewDelegate {
}
