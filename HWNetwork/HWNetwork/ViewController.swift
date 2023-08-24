//
//  ViewController.swift
//  HWNetwork
//
//  Created by Алексей on 22.08.2023.
//
import UIKit
import WebKit

//class ViewController: UIViewController {
//
//    private var imageView: UIImageView = {
//
//        guard let image = UIImage(named: "image") else {
//                return UIImageView(image: UIImage(systemName: "not find"))
//            }
//            return UIImageView(image: image)
//        }()
//
//        private var labelView: UILabel = {
//            let label = UILabel()
//            label.text = "Авторизация"
//            label.textAlignment = .center
//            label.font = UIFont(name: "Papyrus", size: 24)
//            label.textColor = .black
//            return label
//        }()
//
//        private var loginField: UITextField = {
//            let login = UITextField()
//            login.layer.borderWidth = 1
//            login.layer.borderColor = UIColor.black.cgColor
//            login.textColor = .black
//            let placeholderText = NSAttributedString(string: "Логин",attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
//            login.attributedPlaceholder = placeholderText
//            return login
//        }()
//
//    private var passwordField: UITextField = {
//        let login = UITextField()
//        login.layer.borderWidth = 1
//        login.layer.borderColor = UIColor.black.cgColor
//        login.textColor = .black
//        let placeholderText = NSAttributedString(string: "Пароль",attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
//        login.attributedPlaceholder = placeholderText
//        return login
//    }()
//        private var buttonView: UIButton = {
//            let button = UIButton()
//            button.setTitle("Войти", for: .normal)
//            button.setTitleColor(.blue, for: .normal)
//            return button
//        }()
class ViewController : UIViewController{
    private lazy var  webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupViews()
           
            let url = URL(string: "https://oath.vk.com/autorize?client_id=51735178&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token")
            webWiew.load(URLRequest(url: url!))
        }
        private func setupViews() {
            view.addSubview(webView)
            
        }

        
    private func tab(){
        let tab1 = UINavigationController(rootViewController: FriendTableViewController)
        let tab2 = UINavigationController(rootViewController: GroupsTableViewController)
        let tab3 = UINavigationController(rootViewController: PhotosCollectionViewController(collectionViewLayout: UICollectionViewLayout))
        tab1.tapBarItem.title = "Friends"
        tab2.tapBarItem.title = "Group"
        tab3.tapBarItem.title = "Photos"
        
        let controllers = [tab1,tab2,tab3]
        
        tabBarController.viewController = controllers
        
    
        guard let firstScene = UIApplication.shared.connectedScenes.first as?
        UIWindowScene,
        let firstWindow = firstScene.windows.first else  {
            return
        }
        firstWindow.rootViewController = tabBarController
    }
    
    }
extension ViewController: WKNavigationDelegate{
    private func webView(_ webView: WKWebView, decidePolicyFor navigationResponce:
                    WKNavigationDelegate, decisionHandler: @escaping
                        (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponce.response.url, url.path ==
                "/blank.html",let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce([String:String]()){result,param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
    
        NetworkService.token = params["access_token"]!
        NetworkService.userID  = params["user_id"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tab()
    }
}

