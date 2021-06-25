//
//  ArticleWorker.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

enum NetworkError: String, Error {
    case NotFound = "Not Found!"
    case SomeThingWentWrong = "Some Thing Went Wrong!"
}

class ArticleWorker {
    
    private let baseUrl: URL! = {
        URL(string: "https://newsapi.org/v2/everything")
    }()
    
    func getArticles(filter: PaginationFilter, completionHandler: @escaping( Result<BaseResponse<[Article]>, NetworkError>) -> Void){
        
        var parameters = ["from":"2021-05-25",
                          "sortBy":"publishedAt",
                          "pageSize": String(filter.itemsPerPage),
                          "page": String(filter.pageIndex),
                          "apiKey":"69d827b04a87480d9ae4de0704f6b697"]
        
        if let searchText = filter.searchText, searchText != "" {
            parameters["q"] = searchText
        }
        else {
            parameters["q"] = "all"
        }
        
        let finalUrl = createUrlComponents(url: baseUrl.absoluteString, with: parameters)
        
        print("url: ", finalUrl)
        
        
        URLSession.shared.dataTask(with: finalUrl) { (data, reponse, error) in
            guard let data = data else {
                completionHandler(.failure(.NotFound))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(BaseResponse<[Article]>.self, from: data)
                
                completionHandler(.success(response))
            }
            catch {
                completionHandler(.failure(.SomeThingWentWrong))
            }
        }.resume()
        
    }
    
    
    private func createUrlComponents(url: String, with parameters: [String: Any]) -> URL{
        var urlComponents = URLComponents(string: url)
        urlComponents?.queryItems = []
        parameters.forEach { element in
            let queryItem = URLQueryItem(name: element.key, value: element.value as? String)
            urlComponents?.queryItems?.append(queryItem)
        }
        
        return urlComponents?.url ?? URL(string: "")!
    }
    
}
