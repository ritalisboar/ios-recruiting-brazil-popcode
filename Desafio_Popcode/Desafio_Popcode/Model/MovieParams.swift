//
//  MovieParams.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 02/05/22.
//

import Foundation

struct MovieParams: Codable {
    let id: Int?
    let adult: Bool?
    let poster_path: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let release_date: String?
    let title: String?
    let vote_average: Float?
    var hasFvorited: Bool?
}

struct RequestParams: Codable {
    let page: Int?
    let results: [MovieParams]
    let total_pages: Int?
    let total_results: Int?
}
