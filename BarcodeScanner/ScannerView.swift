import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String

    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }

    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }

    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}

    final class Coordinator: NSCoder, ScannerVCDelegate {
        private let scannerView: ScannerView

        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }

        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print(barcode)
        }

        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("Bar Code"))
    }
}
