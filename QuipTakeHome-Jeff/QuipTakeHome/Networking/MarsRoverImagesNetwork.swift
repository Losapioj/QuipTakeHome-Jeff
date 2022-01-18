//
//  MarsRoverImagesNetwork.swift
//  QuipTakeHome
//
//  Created by JEFFREY LOSAPIO on 1/17/22.
//

import Combine
import Foundation

enum Path: String {
    case dateImagesPath = "mars-photos/api/v1/rovers/curiosity/photos"
}

class MarsRoverImagesNetwork {
    static func request(_ path: Path, date: Date) -> AnyPublisher<[Photo], Error> {
        guard let baseURL = Constants.Network.baseURL else { return Combine.Fail(error: InternalError.URL).eraseToAnyPublisher() }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        var components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "earth_date", value: dateString),
            URLQueryItem(name: "api_key", value: Constants.Network.apiKey)
        ]
        
        guard let finalURL = components?.url else { return Combine.Fail(error: InternalError.URL).eraseToAnyPublisher() }
        let request = URLRequest(url: finalURL)
        
        return photosDictWrapperResponse(request: request)
            .map { dict -> [Photo] in
                return dict["photos"] ?? []
            }
            .eraseToAnyPublisher()
    }
}

extension MarsRoverImagesNetwork {
    private static func photosDictWrapperResponse(request: URLRequest) -> AnyPublisher<[String: [Photo]], Error> {
        return APIClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
