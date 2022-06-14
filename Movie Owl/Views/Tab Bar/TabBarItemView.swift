//

import UIKit

class TabBarItemView: UIView {

    init(tab: TabBarItem) {
        super.init(frame: .zero)

        let label = UILabel()
        label.text = tab.title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        self.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
}
