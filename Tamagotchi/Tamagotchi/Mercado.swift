import Foundation
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
