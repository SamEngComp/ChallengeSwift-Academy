import Foundation

class Baby{
    var saudeStatus: Bool
    var saudeContador: Int

    var alimentacaoStatus: Int
    var atencaoStatus: Int

    var higieneStatus: Bool
    var higieneContador: Int

    var sonoStatus: Bool
    var dormindoStatus: Bool
    var energia: Int
    
    var geladeira = Array<Mercadoria>()
    var farmacia = Array<Mercadoria>()
    
    var prints: BabyPrints

    init(){
        self.saudeStatus = true
        self.saudeContador = 50

        self.alimentacaoStatus = 50
        self.atencaoStatus = 50

        self.higieneStatus = true
        self.higieneContador = 50

        self.sonoStatus = false
        self.dormindoStatus = false
        self.energia = 100
      
        
        self.prints = BabyPrints()
    }
    
    func alimentar(_ idAlimento: Int){

      let ben = self.geladeira[idAlimento].beneficio
      if self.alimentacaoStatus == 100 || (self.alimentacaoStatus + ben) > 100{
        print("""
-------------------------------------------------------------
|        Nao pode o alimentar pois ele esta' cheio          |
-------------------------------------------------------------
""")
        return
      }
      self.alimentacaoStatus += ben
        if self.alimentacaoStatus <= 60 {
      
          if self.higieneContador + 1 >= 100{
            self.higieneContador += 1
          }
        }else{
            if self.higieneContador + (self.alimentacaoStatus-60+2) >= 100{
            self.higieneContador += 2
          }

        }
        self.geladeira.remove(at: idAlimento)
    }



    func medicar(_ idRemedio: Int){
        
      let ben = self.farmacia[idRemedio].beneficio
      if self.saudeContador == 100 || (self.saudeContador + ben) > 100{
        
        return
      }
      self.saudeContador += ben
      self.farmacia.remove(at: idRemedio)

    }

    func limpar(){
        self.prints.limpar()
        self.higieneContador = 0
        self.higieneStatus = true
    }

    func dormir(){
        
        if self.energia == 100 {
            if self.dormindoStatus == true{
                self.prints.ligarLuz()
            }else{
                print("""
-------------------------------------------------------------
|Nao pode colocar para dormir pois a energia dele estar 100%|
-------------------------------------------------------------
""")
            }
        }else{
            if self.dormindoStatus == true{
                self.prints.ligarLuz()
                if self.energia <= 40{
                    self.prints.sono_print()
                }
            }else{
                self.prints.sono_print()
            }
        }
    }

    func verificar_alimentacao(){
      if(self.alimentacaoStatus >= 80){
        self.higieneStatus = false
      }
    }

    func addAlimentoGel(_ ali: Mercadoria){
        self.geladeira.append(ali)
    }
    func addRemedioFar(_ re: Mercadoria){
        self.farmacia.append(re)
    }
    
    func estado(){
        if self.alimentacaoStatus <= 40{
            if self.higieneStatus == false && self.saudeStatus == false{
                print(prints.baby_doente_sujo_fome)
            }else if self.higieneStatus == false{
                print(prints.baby_fome_sujo)
            }else if self.saudeStatus == false{
                print(prints.baby_fome_doente)
            }else{
                print(prints.baby_fome)
            }
        }else{
            if self.higieneStatus == false && self.saudeStatus == false{
                print(prints.baby_doente_sujo)
            }else if self.higieneStatus == false{
                print("Aqui")
                prints.babySujo()
            }else if self.saudeStatus == false{
                print(prints.baby_doente)
            }else{
                print(prints.baby_normal)
            }
        }
    }
    
    
}
