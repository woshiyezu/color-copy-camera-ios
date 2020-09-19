import UIKit
import Combine
import AVFoundation

class AVFoundationViewModel: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {

    var previewLayer: CALayer!
    
    @Published var colorCode: String?

    private let captureSession = AVCaptureSession()

    private var capturepDevice: AVCaptureDevice!

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

        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String:kCVPixelFormatType_32BGRA]

        if captureSession.canAddOutput(dataOutput) {
            captureSession.addOutput(dataOutput)
        }
        
        captureSession.commitConfiguration()
        
        let queue = DispatchQueue(label: "FromF.github.com.AVFoundationSwiftUI.AVFoundation")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
    }

    func startSession() {
        if captureSession.isRunning { return }
        captureSession.startRunning()
    }

    func endSession() {
        if !captureSession.isRunning { return }
        captureSession.stopRunning()
    }
    
    // MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        var newColorCode: String? = nil
        
        if let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
            let ciimage : CIImage = CIImage(cvPixelBuffer: pixelBuffer)
            let image : UIImage = self.convert(cmage: ciimage)
            newColorCode = image.centerColor
        }
        
        DispatchQueue.main.async {
            self.colorCode = newColorCode
        }
    }
    
    private func convert(cmage:CIImage) -> UIImage {
         let context:CIContext = CIContext.init(options: nil)
         let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
         let image:UIImage = UIImage.init(cgImage: cgImage)
         return image
    }
}
