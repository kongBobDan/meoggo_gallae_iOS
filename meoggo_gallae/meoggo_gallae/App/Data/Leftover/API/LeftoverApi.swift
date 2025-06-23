//
//  LeftoverApi.swift
//  meoggo_gallae
//
//  Created by 이다경 on 6/23/25.
//

import SwiftUI
import Alamofire

struct LeftoverAPI {
    static func postLeftoverRecord(image: UIImage, completion: @escaping (Result<LeftoverResponse, Error>) -> Void) {
        let url = URL(string: MGURL.Leftover.postLeftoverCheck)!
        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        
        let userId = 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let recordDate = dateFormatter.string(from: Date())
        
        AF.upload(multipartFormData: { formData in
            if let imageData = image.jpegData(compressionQuality: 0.8) {
                formData.append(imageData, withName: "image", fileName: "leftover.jpg", mimeType: "image/jpeg")
            }
            formData.append("\(userId)".data(using: .utf8)!, withName: "userId")
            formData.append(recordDate.data(using: .utf8)!, withName: "recordDate")
        }, to: url, method: .post, headers: headers)
        .responseDecodable(of: LeftoverResponse.self) { response in
            switch response.result {
            case .success(let leftover):
                completion(.success(leftover))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
