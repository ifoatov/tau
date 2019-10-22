//
//  NetworkService.swift
//  Tau
//
//  Created by Iskander Foatov on 22.10.2019.
//  Copyright © 2019 Iskander Foatov. All rights reserved.
//

import Foundation

enum Endponts: String {
    case locations = "https://api.tau.tools/v1/locations"
    case locationInfo = "https://api.tau.tools/v1/locations/"
}

enum NetworkServiceError: Error {
    case badUrl
    case noData
}

final class NetworkService {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    public func getLocations(with completion: @escaping (Result<[LocationEntity], Error>)->()) {
        guard let url = URL(string: Endponts.locations.rawValue) else {
            completion(Result.failure(NetworkServiceError.badUrl))
            return
        }
        self.urlSession.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(Result.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkServiceError.noData))
                return
            }
            do {
                let result = try JSONDecoder().decode([LocationEntity].self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    public func getLocationInfo(locationId: String, completion: @escaping (Result<LocationInfo, Error>) -> ()) {
        guard let url = URL(string: Endponts.locations.rawValue + locationId) else {
            completion(Result.failure(NetworkServiceError.badUrl))
            return
        }
        self.urlSession.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(Result.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkServiceError.noData))
                return
            }
            do {
                let result = try JSONDecoder().decode(LocationInfo.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
