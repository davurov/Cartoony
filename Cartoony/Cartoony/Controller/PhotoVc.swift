//
//  PhotoVc.swift
//  Cartoony
//
//  Created by Abduraxmon on 05/12/22.
//

import UIKit
import CoreML
import Vision

class PhotoVc: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var classificationResult : [VNClassificationObservation] = []
    var characterName: String?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        //characterName = ""
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not covert to ci image")
            }
            detect(image: ciimage)
            
        }
        
        imagePicker.dismiss(animated: true)
        
    }
    
    func detect(image : CIImage) {
        guard let model = try? VNCoreMLModel(for: Cartoony_1().model) else {
            fatalError("can't load ML model")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            request.usesCPUOnly = true
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first
            else {
                print("Result ",request.results ?? 0)
                print("First Result ",request.results?.first ?? 0)
                fatalError("\(error!)😛😛😛😛😛")
            }
            
            self.characterName = topResult.identifier
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
    }
    
    @IBAction func retryPressed(_ sender: Any) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        present(imagePicker,animated: true)
    }
    
    @IBAction func galeryPressed(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true)
    }
    
    
    @IBAction func nextPressed(_ sender: Any) {
        let vc3 = ResultVc(nibName: "ResultVc", bundle: nil)
        vc3.modalPresentationStyle = .fullScreen
        present(vc3, animated: true)
        vc3.nameLbl.text = characterName
        vc3.resultImage.image = UIImage(named: characterName ?? "Not")
    }
    
}
