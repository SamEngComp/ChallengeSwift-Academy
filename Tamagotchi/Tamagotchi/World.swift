import Foundation
// World é o pequeno mundo de tamagotchi o Baby
class World{
    //Atributos
    /* Esse mundo é constituido do Baby e da Loja onde ele adiquire as
     Mercadorias*/
    //_________________________
    var tamagotchi: Baby
    var loja: Mercado
    //-------------------------
    
    init(){
        self.tamagotchi = Baby()
        self.loja = Mercado()
    }
    
    //menu geladeira
//-----------------------------------------------
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
//-----------------------------------------------
    
    // menu farmacia
//-----------------------------------------------
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
//-----------------------------------------------
    
    //menu principal
//-----------------------------------------------
    func menu_principal(){
        
        if self.tamagotchi.dormindoStatus {
            print("""
--------------------------------------
| 1- Acordar                         |
| 2- Sair                            |
--------------------------------------
""")
            return
        }
        
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
//-----------------------------------------------
    
    //menu mercado
//-----------------------------------------------
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
//-----------------------------------------------
    
    // funcao para comprar um produto
//-----------------------------------------------
    func comprarMercadoria(_ id: Int){
        
        let nao = """
--------------------------------------
|   SEU DINHEIRO NAO É INSUFICIENTE  |
--------------------------------------
"""
        
        if self.loja.listaAlimento.count > id{
            if(self.tamagotchi.dinheiro >= self.loja.listaAlimento[id].preco){
                self.tamagotchi.addAlimentoGel(self.loja.listaAlimento[id])
                self.tamagotchi.dinheiro -= self.loja.listaAlimento[id].preco
            }else{
                print(nao)
            }
        }else{
            let aux = id - self.loja.listaAlimento.count
            if(self.tamagotchi.dinheiro >= self.loja.listaRemedio[aux].preco){
                self.tamagotchi.addRemedioFar(self.loja.listaRemedio[aux])
                self.tamagotchi.dinheiro -= self.loja.listaRemedio[aux].preco
            }else{
                print(nao)
            }
        }
    }
//-----------------------------------------------
    
    // para imprimir um valor nao existente
//-----------------------------------------------
    func invalidoPrint(){
        print("""

--------------------------------------
|       NAO EXISTE ESSA OPCAO        |
--------------------------------------

""")
//-----------------------------------------------
    }
    
    
    
}
