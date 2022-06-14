//

import UIKit

struct TabBarItem {
    let tab: Tab
    let title: String
    let image: String
    let vc: UIViewController

    init (tab: Tab) {
        self.tab = tab

        switch self.tab {
        case .home:
            self.title = "Home"
            self.image = "house"
            self.vc = HomeVC()
        case .stars:
            self.title = "Stars"
            self.image = "person.3.fill"
            self.vc = StarsVC()
        case .search:
            self.title = "Search"
            self.image = "sparkle.magnifyingglass"
            self.vc = SearchVC()
        case .settings:
            self.title = "Settings"
            self.image = "gearshape.fill"
            self.vc = SettingsVC()
        }
    }

    enum Tab {
        case home, stars, search, settings
    }
}
