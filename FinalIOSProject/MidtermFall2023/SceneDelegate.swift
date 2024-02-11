//
//  SceneDelegate.swift
//  MidtermFall2023
//
//  Created by Daniel Carvalho on 24/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        class SceneDelegate: UIResponder, UIWindowSceneDelegate {

            var window: UIWindow?

            // This method is called when the app's scene is about to connect to a window scene.
            func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
                // Use this method to configure and attach the app's main UIWindow to the provided UIWindowScene.
                // If using a storyboard, the `window` property is automatically initialized and attached to the scene.
                // It ensures that the app's user interface is properly set up when the scene connects.
                guard let _ = (scene as? UIWindowScene) else { return }
            }

            // This method is called when the scene is disconnected, typically when the app goes into the background.
            func sceneDidDisconnect(_ scene: UIScene) {
                // It's a good place to release any resources associated with the scene that can be re-created
                // when the scene is reconnected. The scene might re-connect later, so it's a good practice to release resources here.
            }

            // This method is called when the scene transitions from an inactive state to an active state.
            func sceneDidBecomeActive(_ scene: UIScene) {
                // Use this method to restart any tasks that were paused or not yet started when the scene was inactive.
            }

            // This method is called when the scene will move from an active state to an inactive state,
            // which may occur due to temporary interruptions (e.g., an incoming phone call).
            func sceneWillResignActive(_ scene: UIScene) {
                // You can use this method to handle any necessary actions before the scene becomes inactive.
            }

            // This method is called as the scene transitions from the background to the foreground.
            func sceneWillEnterForeground(_ scene: UIScene) {
                // Use this method to undo any changes made to the app's state when it entered the background.
            }

            // This method is called when the scene transitions from the foreground to the background.
            func sceneDidEnterBackground(_ scene: UIScene) {
                // Use this method to save data, release shared resources, and store enough scene-specific state information
                // to restore the scene back to its current state when it re-enters the foreground.
            }
        }

    }


}

