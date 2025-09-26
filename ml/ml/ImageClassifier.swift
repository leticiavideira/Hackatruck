//
//  ImageClassifier.swift
//  ml
//
//  Created by Turma02-18 on 23/09/25.
//

import Foundation
import CoreML
import Vision
import UIKit

class ImageClassifier: ObservableObject {
    @Published var classification: String = "Nenhuma previsão"

    private var model: VNCoreMLModel?

    init() {
        if let mlModel = try? MobileNetV2(configuration: MLModelConfiguration()).model {
            model = try? VNCoreMLModel(for: mlModel)
        }
    }

    func classify(image: UIImage) {
        guard let model = model else { return }
        guard let ciImage = CIImage(image: image) else { return }

        let request = VNCoreMLRequest(model: model) { [weak self] request, _ in
            if let results = request.results as? [VNClassificationObservation],
               let first = results.first {
                DispatchQueue.main.async {
                    self?.classification = "\(first.identifier) - \(Int(first.confidence * 100))%"
                }
            }
        }

        let handler = VNImageRequestHandler(ciImage: ciImage)
        try? handler.perform([request])
    }
}

