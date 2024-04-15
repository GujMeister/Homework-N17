import UIKit

class AddCardVC: UIViewController {
    // MARK: - Properties
    //Selected Icon
    var selectedIcon: UIButton?
    var selectedIconString: String?
    
    //Icon Buttons
    private var redIconButton: UIButton?
    private var blueIconButton: UIButton?
    private var greenIconButton: UIButton?
    private var yellowIconButton: UIButton?
    
    //UI Components
    var collectionViewToReload: UICollectionView?
    private let titleTextField = UITextField()
    private let descriptionTextField = UITextField()
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        let titleLabel = UILabel()
        titleLabel.text = "   სათაური"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "FiraGO-Bold", size: 14)
        titleLabel.textColor = .white
        
        titleTextField.borderStyle = .roundedRect
        titleTextField.placeholder = "  მაგ: პანიკა, დახმარება მჭირდება"
        titleTextField.backgroundColor = UIColor(hex: "1F222D")
        titleTextField.textColor = .white
        titleTextField.layer.cornerRadius = 8.0
        titleTextField.layer.borderWidth = 1.0
        titleTextField.layer.borderColor = UIColor.white.cgColor
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "FiraGO", size: 12) ?? UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(hex: "636363")
        ]
        
        titleTextField.attributedPlaceholder = NSAttributedString(string: titleTextField.placeholder ?? "", attributes: attributes)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleTextField)
        
        return stackView
    }()
    
    private let selectIconLabel: UILabel = {
        let label = UILabel()
        label.text = "აირჩიეთ აიქონი"
        label.textColor = .white
        label.font = UIFont(name: "FiraGO", size: 14)
        return label
    }()
    
    lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "   აღწერა"
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont(name: "FiraGO-Bold", size: 14)
        descriptionLabel.textColor = .white
        
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.placeholder = "  მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ"
        descriptionTextField.backgroundColor = UIColor(hex: "1F222D")
        descriptionTextField.textColor = .white
        descriptionTextField.layer.cornerRadius = 8.0
        descriptionTextField.layer.borderWidth = 1.0
        descriptionTextField.layer.borderColor = UIColor.white.cgColor
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "FiraGO", size: 12) ?? UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(hex: "636363")
        ]
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: descriptionTextField.placeholder ?? "", attributes: attributes)
        
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(descriptionTextField)
        
        return stackView
    }()
    
    lazy var iconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        
        let redButton = createIconButton(withImageNamed: "RedIcon")
        let blueButton = createIconButton(withImageNamed: "BlueIcon")
        let greenButton = createIconButton(withImageNamed: "GreenIcon")
        let yellowButton = createIconButton(withImageNamed: "YellowIcon")
        
        redIconButton = redButton
        blueIconButton = blueButton
        greenIconButton = greenButton
        yellowIconButton = yellowButton
        
        if let redButton = redIconButton {
            stackView.addArrangedSubview(redButton)
        }
        if let blueButton = blueIconButton {
            stackView.addArrangedSubview(blueButton)
        }
        if let greenButton = greenIconButton {
            stackView.addArrangedSubview(greenButton)
        }
        if let yellowButton = yellowIconButton {
            stackView.addArrangedSubview(yellowButton)
        }
        
        return stackView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("დამატება", for: .normal)
        button.backgroundColor = UIColor(hex: "009B10")
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.titleLabel?.font = UIFont(name: "FiraGO-Bold", size: 14)
        button.layer.cornerRadius = 22
        
        button.addAction(UIAction(handler: { _ in
            self.addComplaint()
        }), for: .touchUpInside)
        
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDismissButtonForTextFields()
    }
    // MARK: - UI
    func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleStackView)
        view.addSubview(descriptionStackView)
        view.addSubview(selectIconLabel)
        view.addSubview(iconStackView)
        view.addSubview(addButton)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        selectIconLabel.translatesAutoresizingMaskIntoConstraints = false
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            titleStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 310/375),
            titleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            descriptionStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: titleStackView.trailingAnchor),
            descriptionStackView.widthAnchor.constraint(equalTo: titleStackView.widthAnchor),
            descriptionStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 30),
            
            selectIconLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            selectIconLabel.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: 30),
            
            iconStackView.topAnchor.constraint(equalTo: selectIconLabel.bottomAnchor, constant: 14),
            iconStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            iconStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.054),
            iconStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 120/375),
            addButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 48/812)
        ])
        
        titleTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 45/812).isActive = true
        descriptionTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 45/812).isActive = true
    }
    //MARK: - Dismiss Button In Keyboard
    func setupDismissButtonForTextFields() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        
        toolbar.items = [flexibleSpace, doneButton]
        
        titleTextField.inputAccessoryView = toolbar
        descriptionTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //MARK: - Choosing Icon Buttons Logic
    @objc func handleIconButtonTap(sender: UIButton) {
        print("Icon button tapped")
        deselectAllButtons(except: sender)

        sender.isSelected = true
        
        let scaleFactor: CGFloat = 1.3
        sender.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)

        selectedIcon = sender
        if sender == redIconButton {
            selectedIconString = "RedIcon"
        } else if sender == blueIconButton {
            selectedIconString = "BlueIcon"
        } else if sender == yellowIconButton {
            selectedIconString = "YellowIcon"
        } else if sender == greenIconButton {
            selectedIconString = "GreenIcon"
        }
    }

    func deselectAllButtons(except selectedButton: UIButton) {
        redIconButton?.isSelected = false
        resetButtonSize(redIconButton)

        blueIconButton?.isSelected = false
        resetButtonSize(blueIconButton)

        greenIconButton?.isSelected = false
        resetButtonSize(greenIconButton)

        yellowIconButton?.isSelected = false
        resetButtonSize(yellowIconButton)
    }

    func resetButtonSize(_ button: UIButton?) {
        guard let button = button else { return }
        button.transform = .identity
    }
    
    //MARK: - Helper Functions
    func createIconButton(withImageNamed imageName: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.handleIconButtonTap(sender: button)
        }), for: .touchUpInside)
        
        return button
    }
    
    func addComplaint() {
        guard let title = titleTextField.text,
              let description = descriptionTextField.text,
              let selectedIcon = selectedIconString else {
            return
        }
        
        let complaint = ComplaintData(imageName: selectedIcon,
                                      title: title,
                                      description: description)
        complaintData.append(complaint)
        
        titleTextField.text = ""
        descriptionTextField.text = ""
        
        collectionViewToReload?.reloadData()
    }
}

#Preview {
    AddCardVC()
}
