//

import UIKit
import JsHelper

class TabBarVC: UIViewController {
    // model
    let tabBarViewModel = TabBarViewModel()

    // constants
    let tabBarHeight: CGFloat = 70
    let tabBarInset: CGFloat = 30

    // vcs
    let home = HomeVC()
    let search = SearchVC()
    let settings = SettingsVC()

    // views
    let tabBar: UIStackView = {
        // stack view
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 8
        sv.distribution = .fillEqually
        // background blur
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        blurEffectView.frame = sv.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = .cornerRadius
        blurEffectView.clipsToBounds = true
        sv.addSubview(blurEffectView)

        return sv
    }()

    // did load
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed

        addTabBar()
        addTabs()
    }
}

// MARK: - Setup tabbar ui
extension TabBarVC {
    // add & layout tab bar
    func addTabBar() {
        self.view.addSubview(tabBar)

        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tabBarInset),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tabBarInset),
            tabBar.heightAnchor.constraint(equalToConstant: tabBarHeight),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tabBarInset)
        ])
    }

    // add tabs
    func addTabs() {
        for tab in tabBarViewModel.tabs {
            let item = TabBarItemView(tab: tab)
            tabBar.addArrangedSubview(item)
        }
    }

    // tab change tap
    @objc func tabDidChange() {

    }
}
