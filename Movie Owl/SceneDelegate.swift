//

import UIKit
import JsHelper

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let window = makeWindow(for: scene, with: TabBar()) {
            self.window = window
        }
    }
}

