//
//  Characters.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation


class CharactersRepository: CharacterGateway {
    private let apiClient: ApiClient
    
    init() {
        apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                 completionHandlerQueue: OperationQueue.main)
    }
    func getCharacterById(id: Int, completionHandler:@escaping (Result<Character>) -> Void) {
        let characterApiRequest = CharacterRequestById(characterId: id)
        apiClient.execute(request: characterApiRequest) { (result: Result<ApiResponse<CharacterDataWrapper>>) in
            switch result {
            case let .success(response):
                let character = response.entity.data?.results?[0].character
                if let charecterResponse = character{
                    completionHandler(.success(charecterResponse))
                } else {
                    completionHandler(.failure(CoreError(message: "It couldn't possible parser object")))
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }

    }
    
    
    func getCharacters(completionHandler:  @escaping (Result<[Character]>) -> Void) {
        let characterApiRequest = CharacterRequest()
        apiClient.execute(request: characterApiRequest) { (result: Result<ApiResponse<CharacterDataWrapper>>) in
            switch result {
            case let .success(response):
                var characters = [Character]()
                response.entity.data?.results?.forEach { character in characters.append(character.character)}
                completionHandler(.success(characters))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
