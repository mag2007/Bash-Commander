//
//  ExecuteCommand.swift
//  Bash Commander
//
//  Created by Martin Förster on 11.11.20.
//

import Foundation
import Swift_IoC_Container
import RxSwift

protocol ExecuteCommand {
    func invoke(_ command: Command)
}

class ExecuteCommandImpl : ExecuteCommand  {
    
    let bashRepository: BashRepository
    
    init(bashRepository: BashRepository = IoC.shared.resolveOrNil()!) {
        self.bashRepository = bashRepository
    }
    
    func invoke(_ command: Command) {
       return bashRepository.execute(cmd: command.command!, workingDirectory: command.path!)
    }
    
}
