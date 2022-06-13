//

import UIKit

class TabBar: UIViewController {
    let home = HomeVC()
    let search = SearchVC()
    let settings = SettingsVC()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue

        self.addChild(home)
//        self.addChild(search)
//        self.addChild(settings)
        self.view.addSubview(home.view)
//        self.view.addSubview(search.view)
//        self.view.addSubview(settings.view)
        home.didMove(toParent: self)
//        search.didMove(toParent: self)
//        settings.didMove(toParent: self)

        let button = UIButton()
        button.setTitle("Tap", for: .normal)
        view.addSubview(button)
        button.frame = view.frame
        button.bounds = CGRect(origin: view.center, size: CGSize(width: 50, height: 50))
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }

    @objc func tap() {
        print("RAN")
        self.home.view.removeFromSuperview()
        self.home.removeFromParent()
    }
}
