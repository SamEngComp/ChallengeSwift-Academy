import Foundation
class World{
    var tamagotchi: Baby
    var loja: Mercado
    
    var timer = Timer()
    var time = 0
    
    init(){
        self.tamagotchi = Baby()
        self.loja = Mercado()
    }
    
    func start(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: action_time(t: ))
    }
    
    func action_time(t: Timer){
        self.time += 1
        
        print("\(time) s")
    }
    
     func menu_geladeira(){
        print("""

**************************************
|             GELADEIRA              |
**************************************
""")
        var i = 0
        if self.tamagotchi.geladeira.count > 0{
        for ali in self.tamagotchi.geladeira{
            print("""
\(i)- \(ali.nome)
""")
            i += 1
        }
        print("""

--------------------------------------
|     DIGITE O ID DO PRODUTO         |
--------------------------------------

""")
        }else{
            print("""
| Vazia!                             |
--------------------------------------
|cp - Comprar alimento               |
|v - Voltar                          |
--------------------------------------

""")
        }
  }

  func menu_farmacia(){
        print("""
**************************************
|             FARMACIA               |
**************************************

""")
        var i = 0
    if self.tamagotchi.farmacia.count > 0{
        for re in self.tamagotchi.farmacia{
            print("""
\(i)- \(re.nome)
""")
            i += 1
        }
         print("""

--------------------------------------
|     DIGITE O ID DO PRODUTO         |
--------------------------------------

""")
    }else{
        print("""
| Vazia!                             |
--------------------------------------
|cp - Comprar remedio                |
|v - Voltar                          |
--------------------------------------

""")
    }
  }
    func menu_principal(){
        print("""
--------------------------------------
| 1- Alimentar                       |
| 2- Medicar                         |
| 3- Limpar                          |
""")
        if self.tamagotchi.dormindoStatus == true{
            print("""
| 4- Acordar                         |
""")
        }else{
             print("""
| 4- Dormir                          |
""")
        }
        print("""
| 5- Comprar                         |
| 6- Jogar                           |
| 7- Sair                            |
______________________________________


""")
    }
    
    func menu_mercado(){
        print("""
**************************************
|             MERCADO                |
**************************************

--------------------------------------
|            ALIMENTOS               |
--------------------------------------

""")
        var i = 0
        for ali in self.loja.listaAlimento{
            print("""
\(i)- \(ali.nome): \(ali.preco) R$
""")
            i += 1
        }
        print("""

--------------------------------------
|             REMEDIOS               |
--------------------------------------

""")
        for re in self.loja.listaRemedio{
                    print("""
\(i)- \(re.nome): \(re.preco) R$
""")
                    i += 1
        }
        print("""

--------------------------------------
|     DIGITE O ID DO PRODUTO         |
| Ou mn - menu principal             |
--------------------------------------

""")
}
    
    func comprarMercadoria(_ id: Int){
        if self.loja.listaAlimento.count > id{
            self.tamagotchi.addAlimentoGel(self.loja.listaAlimento[id])
        }else{
            let aux = id - self.loja.listaAlimento.count
            self.tamagotchi.addRemedioFar(self.loja.listaRemedio[aux])
        }
    }
    
    func invalidoPrint(){
        print("""

--------------------------------------
|       NAO EXISTE ESSA OPCAO        |
--------------------------------------

""")
    }
    
}
