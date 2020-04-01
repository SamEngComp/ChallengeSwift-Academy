import Foundation
// Uma Mercadoria tem seu nome
// O seu beneficio para saude e energia
// e tem o preço
class Mercadoria{
    var nome: String
    var beneficio: Int
    var preco: Double
    
    init(_ nome: String,_ beneficio: Int,_ preco: Double){
        self.nome = nome
        self.beneficio = beneficio
        self.preco = preco
    }
}
