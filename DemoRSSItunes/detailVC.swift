//
//  detailVC.swift
//  DemoRSSItunes
//
//  Created by Paresh Thakkar on 25/07/21.
//

import UIKit

class detailVC: UIViewController {
    var childView = UIView()
    var topName = ""
    var gen1 = ""
    var gen2 = ""
    var artistName = ""
    var name = ""
    var releaseDate = ""
    var copywrite = ""
    var passimg = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTopView()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
       

    }

}
extension detailVC
{
    func initializeTopView()
    {
        
        let lableName = UILabel()
        let backButton = UIButton()
        let moveToItuneStore = UIButton()
        let stackView = UIStackView()
        let img = UIImageView()
        let lblCopywrite = UILabel()
        let lblArtistName = UILabel()
        let lblName = UILabel()
        let releaseDate = UILabel()
        let genStackView = UIStackView()
        let lblgen1 = UILabel()
        let lblgen2 = UILabel()
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        lableName.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
       moveToItuneStore.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        childView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        view.addSubview(childView)
        childView.addSubview(lableName)
        childView.addSubview(backButton)
        view.addSubview(moveToItuneStore)
        view.addSubview(stackView)
        
        
        childView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        childView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
        childView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        childView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        lableName.centerXAnchor.constraint(equalTo: childView.centerXAnchor).isActive = true
        lableName.centerYAnchor.constraint(equalTo: childView.centerYAnchor).isActive = true
        lableName.leftAnchor.constraint(equalTo: childView.leftAnchor,constant: 100).isActive = true
        lableName.rightAnchor.constraint(equalTo: childView.rightAnchor,constant: -100).isActive = true
        lableName.heightAnchor.constraint(equalTo: childView.heightAnchor,constant: -30).isActive = true
        lableName.text = topName
        
        lableName.font = .systemFont(ofSize: 15, weight: .bold)
        lableName.textColor = .black
        lableName.textAlignment = .center
        lableName.numberOfLines = 2
        
      
        backButton.centerYAnchor.constraint(equalTo: lableName.centerYAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: childView.leftAnchor, constant: 20).isActive = true
        backButton.rightAnchor.constraint(equalTo: lableName.leftAnchor, constant: -10).isActive = true
        backButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(self.buttonBackClicked), for: .touchUpInside)
        
        moveToItuneStore.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moveToItuneStore.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        moveToItuneStore.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20).isActive = true
        moveToItuneStore.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        moveToItuneStore.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        moveToItuneStore.setTitle("Move To itune Store", for: .normal)
        moveToItuneStore.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        moveToItuneStore.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        moveToItuneStore.layer.cornerRadius = 25
        moveToItuneStore.addTarget(self, action: #selector(self.moveToiTuneStore), for: .touchUpInside)
        
        
        
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75).isActive = true
      
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.spacing = 10
        
       

        lblArtistName.text = artistName
        lblArtistName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        lblCopywrite.text = copywrite
        lblCopywrite.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblCopywrite.font = .systemFont(ofSize: 15)
        lblCopywrite.textAlignment = .left
       
        img.image = passimg
        img.contentMode = .scaleAspectFit

        lblName.text = name
        lblName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblName.textAlignment = .left
        
        stackView.addArrangedSubview(img)
        stackView.addArrangedSubview(genStackView)
        stackView.addArrangedSubview(lblName)
        stackView.addArrangedSubview(lblArtistName)
        stackView.addArrangedSubview(releaseDate)
        stackView.addArrangedSubview(lblCopywrite)
        
        genStackView.axis  = NSLayoutConstraint.Axis.horizontal
        genStackView.distribution  = UIStackView.Distribution.fillEqually
        genStackView.spacing = 10
        
        lblgen1.text = gen1
        lblgen1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblgen1.textAlignment = .center
        lblgen1.layer.borderWidth = 1
        lblgen1.layer.cornerRadius = 10
        
        lblgen2.text = gen2
        lblgen2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lblgen2.textAlignment = .center
        lblgen2.layer.borderWidth = 1
        lblgen2.layer.cornerRadius = 10
        
        genStackView.addArrangedSubview(lblgen1)
        genStackView.addArrangedSubview(lblgen2)
        
        


    }
    @objc func buttonBackClicked()
    {
        dismiss(animated: true, completion: nil)

    }
    @objc func moveToiTuneStore()
    {
        if let url = URL(string: "https://www.apple.com/in/itunes/") {
            UIApplication.shared.open(url)
        }

    }
}
