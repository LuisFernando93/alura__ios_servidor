//
//  AlunoAPI.swift
//  Agenda_Servidor
//
//  Created by Luis Fernando Pasquinelli on 09/12/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import Alamofire

class AlunoAPI: NSObject {

    func salvaAlunosNoServidor(parametros: Array<Dictionary<String, String>>) {
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista") else { return }
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        let json = try! JSONSerialization.data(withJSONObject: parametros, options: [])
        requisicao.httpBody = json
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(requisicao)
    }
}
