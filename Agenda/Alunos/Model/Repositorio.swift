//
//  Repositorio.swift
//  Agenda_Servidor
//
//  Created by Luis Fernando Pasquinelli on 09/12/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    func salvaAluno(aluno: Dictionary<String,String>) {
        AlunoAPI().salvaAlunosNoServidor(parametros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }
}
