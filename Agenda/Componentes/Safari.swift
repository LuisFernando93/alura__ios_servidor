//
//  Safari.swift
//  Agenda_Servidor
//
//  Created by Luis Fernando Pasquinelli on 13/03/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import SafariServices

class Safari: NSObject {

    func abrePaginaWeb(_ alunoSelecionado: Aluno, controller: UIViewController) {
        if let urlDoAluno = alunoSelecionado.site {

            var urlFormatada = urlDoAluno

            if !urlFormatada.hasPrefix("http://") {
                urlFormatada = String(format: "http://%@", urlFormatada)
            }

            guard let url = URL(string: urlFormatada) else { return }
            let safariViewController = SFSafariViewController(url: url)
            controller.present(safariViewController, animated: true, completion: nil)
        }
    }
}
