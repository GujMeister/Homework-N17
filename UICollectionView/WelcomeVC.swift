import UIKit

class WelcomeVC: UIViewController {
    // MARK: - Properties
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background-2")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "FiraGo", size: 30)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "შედი\nაპლიკაციაში \nდა იწუწუნე \nრამდენიც გინდა"
        return label
    }()
    
    private lazy var proceedButton: UIButton = {
        let button = UIButton()
        button.setTitle("დაწყება", for: .normal)
        button.backgroundColor = UIColor(hex: "0075FF")
        button.titleLabel?.font = UIFont(name: "FiraGO-Regular", size: 20)
        button.layer.cornerRadius = 20
        
        button.addAction(UIAction(handler: { _ in
            self.didTapProceedButton()
        }), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.widthAnchor.constraint(equalToConstant: 123).isActive = true
        
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - UI
    func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(proceedButton)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        proceedButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            
            proceedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            proceedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    // MARK: - Button Function
    func didTapProceedButton() {
        let vc = ViewController()
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
 
#Preview {
    WelcomeVC()
}
