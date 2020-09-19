import UIKit
import Combine
import AVFoundation

class AVFoundationViewModel: NSObject, ObservableObject {

    var previewLayer:CALayer!

    private let captureSession = AVCaptureSession()

    private var capturepDevice:AVCaptureDevice!

    override init() {
        super.init()

        prepareCamera()
    }

    private func prepareCamera() {
        captureSession.sessionPreset = .photo

        if let availableDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices.first {
            capturepDevice = availableDevice
            beginSession()
        } else {
            print("capture devices are not available.")
        }
    }
    
    private func beginSession() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: capturepDevice)

            captureSession.addInput(captureDeviceInput)
        } catch {
            print(error.localizedDescription)
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer = previewLayer

        captureSession.commitConfiguration()
    }

    func startSession() {
        if captureSession.isRunning { return }
        captureSession.startRunning()
    }

    func endSession() {
        if !captureSession.isRunning { return }
        captureSession.stopRunning()
    }
}
