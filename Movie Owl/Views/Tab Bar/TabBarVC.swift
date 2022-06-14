//

import UIKit
import JsHelper

class TabBarVC: UITabBarController {
    // tabs
    let tabs: [TabBarItem] = [
        TabBarItem(tab: .home),
        TabBarItem(tab: .stars),
        TabBarItem(tab: .search),
        TabBarItem(tab: .settings),
    ]

    // constants
    private let tabBarHeight: CGFloat = 70
    private let tabBarInset: CGFloat = 30

    // views
    private let tabBarView: UIStackView = {
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
        self.tabBar.isHidden = true

        addTabBar()
        addTabs()
    }
}

// MARK: - Setup tabbar ui
extension TabBarVC {
    // add & layout tab bar
    private func addTabBar() {
        self.view.addSubview(tabBarView)

        NSLayoutConstraint.activate([
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tabBarInset),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tabBarInset),
            tabBarView.heightAnchor.constraint(equalToConstant: tabBarHeight),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tabBarInset)
        ])
    }

    // add tabs
    private func addTabs() {
        var vcs: [UIViewController] = []

        for tab in tabs {
            let item = TabBarItemView(tab: tab)
            let tap = TabTapGestureRecognizer(target: self, action: #selector(didTap))
            tap.tab = tab
            item.addGestureRecognizer(tap)

            // mark home as selected
            if tab.tab == .home {
                item.markAs(true)
            }

            tabBarView.addArrangedSubview(item)

            vcs.append(tab.vc)
        }

        self.viewControllers = vcs
    }

    // objc did tap
    @objc private func didTap(sender: TabTapGestureRecognizer) {
        if let tab = sender.tab {
            selectedIndex = tab.index
            for subview in tabBarView.arrangedSubviews {
                if let tabView = subview as? TabBarItemView {
                    if tabView.tab == tab {
                        tabView.markAs(true)
                    } else {
                        tabView.markAs(false)
                    }
                }
            }
        }
    }
}
