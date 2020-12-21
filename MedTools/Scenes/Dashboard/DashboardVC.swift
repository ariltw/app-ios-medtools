//
//  DashboardVC.swift
//  MedTools
//
//  Created by Ariel on 18/12/20.
//

import UIKit
import ImageSlideshow

protocol DashboardDisplayLogic: class {
    func tooslResult(completion: Result<Dashboard.ViewModel, Error>)
}

class DashboardVC: UIViewController, DashboardDisplayLogic {
    
    @IBOutlet weak var toolsTableView: UITableView!
    
    private var slideshowTransitioningDelegate: ZoomAnimatedTransitioningDelegate? = nil
    private var interactor: DashboardBusinessLogic?
    private var data = [Tool]()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolsTableView.delegate = self
        toolsTableView.dataSource = self
        toolsTableView.register(UINib(nibName: "ImageBannerView", bundle: nil), forCellReuseIdentifier: "ImageBannerView")
        
        // do request to get tools image list
        interactor?.requestTools()
    }
    
    func tooslResult(completion: Result<Dashboard.ViewModel, Error>) {
        switch completion {
        case .success(let viewModel):
            self.data = viewModel.tools
            toolsTableView.reloadData()
        case .failure(let error):
            Alert.showErrorDialog(on: self, with: error as! BaseError)
        }
    }
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageBannerView", for: indexPath) as! ImageBannerView
        cell.setupData(
            title: data[indexPath.row].name,
            image: data[indexPath.row].imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fullScreenController = FullScreenSlideshowViewController()
        fullScreenController.inputs = data.map { $0.inputSource }
        fullScreenController.initialPage = indexPath.row

        if let cell = tableView.cellForRow(at: indexPath), let imageView = cell.imageView {
            slideshowTransitioningDelegate = ZoomAnimatedTransitioningDelegate(imageView: imageView, slideshowController: fullScreenController)
            fullScreenController.modalPresentationStyle = .custom
            fullScreenController.transitioningDelegate = slideshowTransitioningDelegate
        }

        fullScreenController.slideshow.currentPageChanged = { [weak self] page in
            if let cell = tableView.cellForRow(at: IndexPath(row: page, section: 0)), let imageView = cell.imageView {
                self?.slideshowTransitioningDelegate?.referenceImageView = imageView
            }
        }

        present(fullScreenController, animated: true, completion: nil)
    }
}
