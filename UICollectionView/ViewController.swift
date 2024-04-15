import UIKit
import Foundation

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    private let newCardButton: UIButton = {
        let button = UIButton()
        button.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        button.backgroundColor = UIColor(hex: "0075FF")
        button.titleLabel?.font = UIFont(name: "FiraGO", size: 14)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(collectionView)
        view.addSubview(newCardButton)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        newCardButton.translatesAutoresizingMaskIntoConstraints = false
        
        let screenHeight: CGFloat = view.frame.height
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            newCardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -104),
            newCardButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.77),
            newCardButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 48/812),
            newCardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

// MARK: - Data Source
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return complaintData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseIdentifier, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let complaintData = complaintData[indexPath.row]
        cell.configureCell(with: complaintData.imageName, text1: complaintData.title, text2: complaintData.description)
        
        cell.backgroundColor = UIColor(hex: "262A34")
        let radius: CGFloat = 10
        cell.layer.cornerRadius = radius
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = 8 * 2 // 8 points for leading and trailing space of each cell, and space between cells
        let availableWidth = collectionView.bounds.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem, height: 250)
    }
}

#Preview {
    ViewController()
}
