//
//  ViewController.swift
//  DemoRSSItunes
//
//  Created by Paresh Thakkar on 24/07/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var tblView : UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    var childView = UIView()
    var feed : Feed?
    var result : [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.apiCall()
        self.initializeTopView()
        self.initializeTableView()
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: CustomCell.cellIdentifier, for: indexPath) as! CustomCell
        cell.lblAlbumName.text = result[indexPath.row].name
        cell.lblArtistName.text = result[indexPath.row].artistName
        cell.imgView.loadImageFromUrl(urlString: result[indexPath.row].artworkUrl100)
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tblView.cellForRow(at: indexPath) as! CustomCell
        let rootView = detailVC()
        let newVC = UINavigationController(rootViewController: rootView)
        newVC.modalPresentationStyle = .fullScreen
        rootView.topName = result[indexPath.row].name
        let gen = result[indexPath.row].genres
        let gen1 = gen[0].name
        let gen2 = gen[1].name
        rootView.gen1 = gen1
        rootView.gen2 = gen2
        rootView.copywrite = feed?.copyright ?? ""
        let img = resizeImage(image: cell.imgView.image ?? #imageLiteral(resourceName: "road-sign-361514_960_720"), targetSize: CGSize(width: 80.0, height: 80.0))
        rootView.passimg = img ?? #imageLiteral(resourceName: "road-sign-361514_960_720")
        rootView.name = result[indexPath.row].name
        rootView.artistName = result[indexPath.row].artistName
        
        present(newVC, animated: true, completion: nil)
    }
    
}
extension ViewController
{
   
    func initializeTopView()
    {
        let lableName = UILabel()
        childView.translatesAutoresizingMaskIntoConstraints = false
        lableName.translatesAutoresizingMaskIntoConstraints = false
        
        childView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        view.addSubview(childView)
        childView.addSubview(lableName)
        childView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        childView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
        childView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        childView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        lableName.centerXAnchor.constraint(equalTo: childView.centerXAnchor).isActive = true
        lableName.centerYAnchor.constraint(equalTo: childView.centerYAnchor).isActive = true
        lableName.widthAnchor.constraint(equalTo: childView.widthAnchor,constant: 40).isActive = true
        lableName.text = "List"
        lableName.font = .systemFont(ofSize: 20, weight: .bold)
        lableName.textColor = .black
        lableName.textAlignment = .center
        
    }
    func initializeTableView()
    {
        view.addSubview(tblView)
        tblView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0).isActive = true
        tblView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70.0).isActive = true
        tblView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10.0).isActive = true
        tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
        
        tblView.delegate = self
        tblView.dataSource = self
        
        // register a defalut cell
        tblView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellIdentifier)
    }
    
}
extension ViewController
{
    func apiCall()
    
    {
        let requestURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
        guard let url = URL(string: requestURL) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if(error != nil){
                
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Please check your connection", message: nil, preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        }))
                        self.present(alert, animated: true)
                    }
            }else{
                do
            {
                //  let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? [String : AnyObject]
                let responseModel = try JSONDecoder().decode(ModelClass.self, from: data!)
                self.feed = responseModel.feed
                self.result = self.feed?.results ?? []
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                
            }
                catch
                {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        }))
                        self.present(alert, animated: true)
                    }
                }
            }
            
        }).resume()
    }
}
let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    
    func loadImageFromUrl(urlString: String)  {
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString){
            self.image = imageFromCache
            
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do
                {
                    if let imgdata = data {
                        DispatchQueue.main.async {
                            
                            let image = UIImage(data: imgdata)
                            if image != nil
                            {
                                imageCache.setObject(image ?? #imageLiteral(resourceName: "road-sign-361514_960_720"), forKey:urlString as NSString)
                            }
                        }
                        
                        
                    }
                    
                    
                }
            }
            
            
        }).resume()
        
    }
}
func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(origin: .zero, size: newSize)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
}
