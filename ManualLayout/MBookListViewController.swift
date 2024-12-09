//
//  MBookListViewController.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

import UIKit
import Combine

private let CELL_HEIGHT: CGFloat = 100
private let CELL_IDENTIFIER = "MBookTableViewCell"

class MBookListViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()
    private let viewModel = BookListViewModel()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        
        // register cell
        table.register(MBookTableViewCell.self, forCellReuseIdentifier: CELL_IDENTIFIER)
        
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = CELL_HEIGHT
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // should set bgColor, the default one is clearColor/nil
        self.view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        
        setupUI()
        bindViewModel()
        
        viewModel.fetch()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            // TableView
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel.$uiState
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.updateUI(for: state)
            }
            .store(in: &cancellables)
    }
    
    private func updateUI(for state: ViewState) {
        switch state {
        case .loading:
            // TODO: Add loading here
            break
        case .success:
            self.tableView.reloadData()
        case .failure:
            self.showError()
        }
    }
    
    private func showError() {
        let alert = UIAlertController(
            title: "Load Book With Error",
            message: nil,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Dismiss", style: .default) {  [weak self] _ in
            
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

extension MBookListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MBookTableViewCell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as? MBookTableViewCell else { return UITableViewCell() }
        
        let book = viewModel.books[indexPath.row]
        cell.configCell(book: book)
        return cell
    }
}
