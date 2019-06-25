//
//  GroupService.swift
//  TableAdvance
//  这里的代码主要是做多点链接的服务代码
//  Created by 丁莉萍 on 2019/5/7.
//  Copyright © 2019年 丁莉萍. All rights reserved.
//

import Foundation
import MultipeerConnectivity

//命令的服务代理类
protocol MClassServiceDelegate {
    //链接的设备发生变化时
    func connectedDevicesChanged(manager : MClassService,connectedDevices : [String])
    //指令发生变化时
    func CMDChanged(manager : MClassService, CMDString : String)
    //通知客户端做相应的动作
    func NoticeClient(manager : MClassService)
}

class MClassService : NSObject{
    private let MClassServiceType = "MClassService"
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    private let serviceAdvertiser : MCNearbyServiceAdvertiser
    private let serviceBrowser : MCNearbyServiceBrowser
    
    var delegate : MClassServiceDelegate?
    
 
    
    lazy var session : MCSession = {
        let session = MCSession(peer: self.myPeerId, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        return session
    }()
    
    override init() {
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer:myPeerId,discoveryInfo:nil,serviceType: MClassServiceType)
        self.serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: MClassServiceType)
        
        super.init()
        
        self.serviceAdvertiser.delegate = self
        self.serviceAdvertiser.startAdvertisingPeer()
        
        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
        
    }
    
    deinit {
        self.serviceAdvertiser.stopAdvertisingPeer()
        self.serviceBrowser.startBrowsingForPeers()
    }
    
    func send(StrCMD:String,Peer: MCPeerID)
    {
        if(StrCMD != "")
        {
            var xPeers :[MCPeerID] = []
            xPeers.append(Peer)
            do{
                try session.send(StrCMD.data(using:.utf8)!, toPeers: xPeers, with: .reliable)
            }
            catch let error
            {
                NSLog("%@","Error for sending: \(error)")
            }
        }
    }
    
    func send(StrCmd:String,PeerName:String)
    {
        var apeer : MCPeerID = MCPeerID(displayName: "123")
        for var p in session.connectedPeers
        {
            if(p.displayName==PeerName)
            {
                apeer = p
            }
        }
        send(StrCMD:StrCmd,Peer:apeer)
    }
    
    func send(StrCMD:String)
    {
        NSLog("%@", "send: \(StrCMD) to \(session.connectedPeers.count) peers")
        
        if session.connectedPeers.count > 0 {
            do {
                try self.session.send(StrCMD.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            }
            catch let error {
                NSLog("%@", "Error for sending: \(error)")
            }
        }
    }
    
    func sendJson(StrCMD:String)
    {
        NSLog("%@", "send: \(StrCMD) to \(session.connectedPeers.count) peers")
        
        var JsonData : OperaType = OperaType.decodeJSON(from: StrCMD)!
        
         NSLog("%@", "获取参数：\(JsonData.Operationname)")
        var strData :String = String(JsonData.Color!)
        if session.connectedPeers.count > 0 {
            do {
                try self.session.send(strData.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            }
            catch let error {
                NSLog("%@", "Error for sending: \(error)")
            }
        }
    }
}


extension MClassService : MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        NSLog("%@", "didNotStartAdvertisingPeer: \(error)")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        NSLog("%@", "didReceiveInvitationFromPeer \(peerID)")
        invitationHandler(true, self.session)
    }
    
}

extension MClassService : MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        NSLog("%@", "didNotStartBrowsingForPeers: \(error)")
        self.delegate?.NoticeClient(manager: self)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        NSLog("%@", "foundPeer: \(peerID)")
        NSLog("%@", "invitePeer: \(peerID)")
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 10)
        self.delegate?.NoticeClient(manager: self)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        NSLog("%@", "lostPeer: \(peerID)")
        self.delegate?.NoticeClient(manager: self)
    }
    
}

extension MClassService : MCSessionDelegate {
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        NSLog("%@", "peer \(peerID) didChangeState: \(state.rawValue)")
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices:
            session.connectedPeers.map{$0.displayName})
        self.delegate?.NoticeClient(manager: self)
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveData: \(data)")
        let str = String(data: data, encoding: .utf8)!
        self.delegate?.CMDChanged(manager: self, CMDString: str)
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveStream")
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        NSLog("%@", "didStartReceivingResourceWithName")
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        NSLog("%@", "didFinishReceivingResourceWithName")
    }
    
}
