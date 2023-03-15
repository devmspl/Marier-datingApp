//
//  OngoingCallVC.swift
//  Marier
//
//  Created by MacBook M1 on 21/02/23.
//

import UIKit
import AgoraRtcKit
import AgoraUIKit
import AVFoundation

class OngoingCallVC: UIViewController {

    @IBOutlet weak var mainVideoView: UIView!
    @IBOutlet weak var smallVideoView: UIView!
    
    
    // The main entry point for Video SDK
    var agoraEngine: AgoraRtcEngineKit?
    var agoraKit: AgoraRtcEngineKit!
    // By default, set the current user role to broadcaster to both send and receive streams.
    var userRole: AgoraClientRole = .broadcaster

    // Update with the App ID of your project generated on Agora Console.
    let appID = "320f5d8593fe490787d816ab5cdf7477"
    // Update with the temporary token generated in Agora Console.
    var token = "007eJxTYHBde1XqzN59dvE/JuhwLf/0m0sn/1bksYb7qz3i9n56FcGkwGBsZJBmmmJhammclmpiaWBuYZ5iYWiWmGSanJJmbmJunvjhb3JDICODbxIXIyMDBIL4LAwhqcUlDAwAzp4gzA=="
    // Update with the channel name you used to generate the token in Agora Console.
    var channelName = "Test"//
    //
    var agoraView: AgoraVideoViewer!
    //
    var userID: UInt? = 0
    //
        var localView: UIView!
        // The video feed for the remote user is displayed here
        var remoteView: UIView!
        // Click to join or leave a call
        var joinButton: UIButton!

        // Track if the local user is in a call
    
///
    ///
    ///
        override func viewDidLoad() {
            super.viewDidLoad()
//            agoraEngine?.delegate = self
            smallVideoView.isHidden = true
            initializeAndJoinChannel()
        }
//
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            agoraView.exit()
        }
    ///
    ///
//MARK: - initialize agora and join channel
    func initializeAndJoinChannel(){
        agoraView = AgoraVideoViewer(
            connectionData: AgoraConnectionData(
                appId: appID,
                rtcToken: token
            )
        )
        agoraView.fills(view: mainVideoView)
        agoraView.agoraSettings
        agoraView.join(
            channel: channelName,
            with: token,
            as: .broadcaster
        )
    }
//MARK: -
    
///
    ///
   
    ///
  

   ///
    func checkForPermissions() async -> Bool {
        var hasPermissions = await self.avAuthorization(mediaType: .video)
        // Break out, because camera permissions have been denied or restricted.
        if !hasPermissions { return false }
        hasPermissions = await self.avAuthorization(mediaType: .audio)
        return hasPermissions
    }
///
    ///
    func avAuthorization(mediaType: AVMediaType) async -> Bool {
        let mediaAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: mediaType)
        switch mediaAuthorizationStatus {
        case .denied, .restricted: return false
        case .authorized: return true
        case .notDetermined:
            return await withCheckedContinuation { continuation in
                AVCaptureDevice.requestAccess(for: mediaType) { granted in
                    continuation.resume(returning: granted)
                }
            }
        @unknown default: return false
        }
    }
    ///
    ///
   
    ///
    ///
  
    ///
    ///
    @IBAction func downTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func endCall(_ sender: UIButton){
        
    }
    @IBAction func mikeOff(_ sender: UIButton){
        
    }
    @IBAction func cameraSwitch(_ sender: UIButton){
        
    }
    
    
}
////
///
///
///
extension OngoingCallVC:AgoraRtcEngineDelegate{

//    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
//           // Called when a remote user joins the channel
//       }
//
//       func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid: UInt, reason: AgoraUserOfflineReason) {
//           // Called when a remote user leaves the channel
//       }
    
}
