//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        self.addChild(child)
        self.view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove(_ child: UIViewController) {
        if child.parent != nil {
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
}
