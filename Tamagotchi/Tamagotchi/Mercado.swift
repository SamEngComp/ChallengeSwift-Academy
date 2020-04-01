import Foundation

// Sao aqui que ficam armazenado os produtos disponivel para compra
//Como alimento e remedio nesse caso tem os mesmo atributos eles sao Mercadoria
class Mercado{
    var listaAlimento = Array<Mercadoria>()
    var listaRemedio = Array<Mercadoria>()
    
    
    func addAlimento(_ al: Mercadoria){
        self.listaAlimento.append(al)
    }
    func addRemedio(_ re: Mercadoria){
        self.listaRemedio.append(re)
    }
}
