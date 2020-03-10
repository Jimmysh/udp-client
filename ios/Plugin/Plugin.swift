import Capacitor
import Foundation
import Network

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */

// 只支持 ios 12 以上版本
@available(iOS 12.0, *)
@objc(AiaoUDPClient)
public class AiaoUDPClient: CAPPlugin {
    var host = ""
    var port = 12345

    var connection: NWConnection?

    @objc func setup(_ call: CAPPluginCall) {
        host = call.getString("host") ?? ""
        port = call.getInt("port") ?? 12345
        connection = NWConnection(host: NWEndpoint.Host.name(host, nil), port: NWEndpoint.Port(rawValue: UInt16(port))!, using: .udp)
        connection?.stateUpdateHandler = stateDidChange(to:)
        let connectionQueue = DispatchQueue(label: "networkPlayground.sender")
        connection?.start(queue: connectionQueue)
        call.resolve()
    }

    // test
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success(["value": value])
    }

    @objc func send(_ call: CAPPluginCall) {
        if connection != nil {
            let msg = call.getString("value") ?? ""
            connection?.send(content: msg.data(using: .utf8)!, completion: .contentProcessed { sendError in
                if let error = sendError {
                    call.reject("Failed, error: \(error)")
                    self.connectionDidFail(error: error)
                } else {
                    call.resolve(["success": true])
                }
        })
        } else {
            notifyListeners("error", data: ["error": "未连接"])
            call.reject("未连接")
        }
    }

    func stateDidChange(to state: NWConnection.State) {
        switch state {
        case .setup:
            break
        case let .waiting(error):
            connectionDidFail(error: error)
        case .preparing:
            print("Preparing")
            notifyListeners("stateChange", data: ["state": "Preparing"])
        case .ready:
            print("Connected")
            notifyListeners("stateChange", data: ["state": "Connected"])
        case let .failed(error):
            connectionDidFail(error: error)
        case .cancelled:
            break
        @unknown default:
            break
        }
    }

    func connectionDidFail(error: Error) {
        print("Failed, error: \(error)")
        notifyListeners("error", data: ["error": "\(error)"])
        if connection?.stateUpdateHandler != nil {
            connection?.stateUpdateHandler = nil
            connection?.cancel()
        }
    }
}
