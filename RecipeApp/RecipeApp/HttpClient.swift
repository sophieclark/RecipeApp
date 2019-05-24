//
//  HttpClient.swift
//  RecipeApp
//
//  Created by Sophie Clark on 23/05/2019.
//  Copyright © 2019 Sophie Clark. All rights reserved.
//

import Foundation
import RxSwift

enum HttpError: Error {
  case invalidContract
  case internalError(reason: String)
}

enum RequestType: String {
  case post = "POST"
  case get = "GET"
  case delete = "DELETE"
  case put = "PUT"
}

final class HttpClient {
  let session = URLSession.shared
  
  func request<T: Encodable, U: Decodable>(type: RequestType, url: URL, object: T?, headers: [String: String]) -> Observable<U> {
    var request = URLRequest(url: url)
    request.httpMethod = type.rawValue
    
    if let object = object {
      request.httpBody = try? JSONEncoder().encode(object)
    }
    
    request.allHTTPHeaderFields = headers
    return Observable.create { observable in
      let task = self.session.dataTask(with: request, completionHandler: { (data, response, error) in
        if let data = data {
          guard let responseObject = try? JSONDecoder().decode(U.self, from: data) else {
            observable.onError(HttpError.invalidContract)
            observable.onCompleted()
            return
          }
          observable.onNext(responseObject)
          observable.onCompleted()
        } else if let error = error {
          observable.onError(error)
        }
      })
      
      task.resume()
      return Disposables.create()
    }
  }
  
  func request<U: Decodable>(type: RequestType, url: URL, headers: [String: String]) -> Observable<U> {
    var request = URLRequest(url: url)
    request.httpMethod = type.rawValue
    request.allHTTPHeaderFields = headers
    return Observable.create { observable in
      let task = self.session.dataTask(with: request, completionHandler: { (data, response, error) in
        if let data = data {
          guard let responseObject = try? JSONDecoder().decode(U.self, from: data) else {
            observable.onError(HttpError.invalidContract)
            observable.onCompleted()
            return
          }
          observable.onNext(responseObject)
          observable.onCompleted()
        } else if let error = error {
          observable.onError(error)
        }
      })
      
      task.resume()
      return Disposables.create()
    }
  }
}
