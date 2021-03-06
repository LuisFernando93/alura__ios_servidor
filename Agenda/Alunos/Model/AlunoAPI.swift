//
//  AlunoAPI.swift
//  Agenda_Servidor
//
//  Created by Luis Fernando Pasquinelli on 09/12/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import Alamofire

    // MARK: - PUT

class AlunoAPI: NSObject {
    
    func recuperaAlunosDoServidor(completion:@escaping() -> Void) {
        
        Alamofire.request("http://localhost:8080/api/aluno", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                if let resposta = response.result.value! as? Dictionary<String,Any> {
                    guard let listaDeAlunos = resposta["alunos"] as? Array<Dictionary<String,Any>> else { return }
                    for dicionarioDeAlunos in listaDeAlunos {
                        AlunoDAO().salvaAluno(dicionarioDeAluno: dicionarioDeAlunos)
                    }
                    completion()
                }
                break
            
            case .failure:
                print(response.error!)
                completion()
                break
            }
        }
    }

    // MARK: - GET
    
    func salvaAlunosNoServidor(parametros: Array<Dictionary<String, String>>) {
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista") else { return }
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        let json = try! JSONSerialization.data(withJSONObject: parametros, options: [])
        requisicao.httpBody = json
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(requisicao)
    }
    
    // MARK: - DELETE
    
    func deletaAluno(id: String) {
        Alamofire.request("http://localhost:8080/api/aluno/\(id)",method: .delete).responseJSON { (resposta) in
            switch resposta.result {
            case .failure:
                print(resposta.result.error!)
            case .success(_): break
            }
        }
        
    }
}
