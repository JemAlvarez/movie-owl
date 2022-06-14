//

import UIKit
import JsHelper

class TabBarItemView: UIView {
    // properties
    public private(set) var tab: TabBarItem!
    private var selected = false {
        didSet {
            self.label.alpha = selected ? 1 : 0
            populateTab()
        }
    }

    // views
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: .fontCaption2, weight: .semibold)
        label.textColor = .accentColor
        label.alpha = 0
        return label
    }()
    private let image: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .center
        return iv
    }()

    // init
    init(tab: TabBarItem) {
        super.init(frame: .zero)
        self.tab = tab

        self.addSubview(image)
        self.addSubview(label)
        populateTab()
    }

    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }

    // layout items
    override func layoutSubviews() {
        super.layoutSubviews()

        // layout image
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35)
        ])
        // layout title
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.topAnchor.constraint(equalTo: image.bottomAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    // populate tab item
    private func populateTab() {
        // label
        label.text = self.tab.title
        // image
        let fill = (self.tab.tab != .search) ? (selected ? ".fill" : "") : ("")
        image.image = UIImage(systemName: self.tab.image + fill)?
            .applyingSymbolConfiguration(UIImage.SymbolConfiguration(scale: .large))
    }

    // public mark as selected or not
    func markAs(_ selected: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.selected = selected
        }
    }
}
