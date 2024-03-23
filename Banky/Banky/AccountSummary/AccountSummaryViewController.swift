
import UIKit

class AccountSummaryViewController: UIViewController {
    
    struct Profile {
        let firstName: String
        let lastName: String
    }
    
    var profile:Profile?
    var accounts: [AccountSummaryCell.ViewModel] = []
    
    var headerView = AccountSummaryHeaderView(frame: .zero)
    var tableView = UITableView()
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
}

extension AccountSummaryViewController {
    private func setup() {
        setupTableView()
        setupTableHeaderView()
        fetchData()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = appColor
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else {return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
        
        //settings for non customizable cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
//        return cell
        
        // settings for default cell Loading
//        let cell = UITableViewCell()
//        cell.textLabel?.text = games[indexPath.row]
//        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController {
    private func fetchData(){
        fetchAccounts()
    }
    
    private func fetchAccounts(){
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,accountName: "Basic Savings",balance: 23892.54)
        let savings1 = AccountSummaryCell.ViewModel(accountType: .Banking,accountName: "Savings",balance: 342789.29)
        let savings2 = AccountSummaryCell.ViewModel(accountType: .Banking,accountName: "HSA Savings",balance: 9022.20)
        let savings3 = AccountSummaryCell.ViewModel(accountType: .Banking,accountName: "Auto Savings",balance: 1290.12)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,accountName: "Master Card",balance: 3289.32)
        let visa1 = AccountSummaryCell.ViewModel(accountType: .CreditCard,accountName: "Venmo Credit Card",balance: 2389.23)
        let visa2 = AccountSummaryCell.ViewModel(accountType: .CreditCard,accountName: "Starbucks Credit",balance: 143.2)
        let investment = AccountSummaryCell.ViewModel(accountType: .Investment,accountName: "LLQ Liquor 31st Investment",balance: 37281.22)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment,accountName: "Johsntons Tempties Investment",balance: 18738.32)
        
        
        accounts.append(savings)
        accounts.append(savings1)
        accounts.append(savings2)
        accounts.append(savings3)
        accounts.append(visa)
        accounts.append(visa1)
        accounts.append(visa2)
        accounts.append(investment)
        accounts.append(investment1)
        
        
    }
}

extension AccountSummaryViewController {
    @objc func logoutTapped(sender : UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}
