//
//  GenreParamsPresenter.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 03/05/22.
//

import Foundation

class GenreParamsPresenter: ObservableObject {
    @Published var genres = [GenreParams]()

    init() {
    }

    func getGenre() {

        let baseURL = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=3999a53b21ce97f58d4bceeeb3fb9a9e&language=pt-BR")!
        var urlRequest = URLRequest(url: baseURL)
        urlRequest.allHTTPHeaderFields = ["content-type": "application/json"]
        urlRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    if let httpResponse = response as? HTTPURLResponse {
                        (200...299).contains(httpResponse.statusCode)
                        print("StatusCode:", httpResponse.statusCode)
                    } else {
                        print("Invalid Response received from the server")
                        return
                    }

                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response:", response)

                    let object = try JSONDecoder().decode([GenreParams].self, from: data)
                    self.genres = object
                } catch {
                    print(error)
                }
            }

        }.resume()
    }
}
