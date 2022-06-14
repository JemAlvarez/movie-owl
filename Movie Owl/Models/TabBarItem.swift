//

import UIKit

struct TabBarItem: Equatable {
    let tab: Tab
    let title: String
    let image: String
    let vc: UIViewController
    let index: Int

    init (tab: Tab) {
        self.tab = tab

        switch self.tab {
        case .home:
            self.title = "Home"
            self.image = "house"
            self.vc = HomeVC()
            self.index = 0
        case .stars:
            self.title = "Actors"
            self.image = "person.3"
            self.vc = ActorsVC()
            self.index = 1
        case .search:
            self.title = "Search"
            self.image = "magnifyingglass"
            self.vc = SearchVC()
            self.index = 2
        case .settings:
            self.title = "Settings"
            self.image = "gearshape"
            self.vc = SettingsVC()
            self.index = 3
        }
    }

    enum Tab {
        case home, stars, search, settings
    }
}
