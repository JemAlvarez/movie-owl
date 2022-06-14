//

import UIKit

class TabBarViewModel {
    let tabs: [TabBarItem] = [
        TabBarItem(tab: .home),
        TabBarItem(tab: .stars),
        TabBarItem(tab: .search),
        TabBarItem(tab: .settings),
    ]

    var selectedTab: TabBarItem.Tab = .home
}
