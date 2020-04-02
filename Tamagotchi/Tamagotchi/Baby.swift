import Foundation

class Baby{
    
// Atributos do Baby
 //-------------------------------------------------------------------------
    // Sinalizar se Baby está ou nao bem de saúde que será definido pelo
    // saudeContador  (<= 30 mal de saúde ) (>= 30 bem de saúde)
    var saudeStatus: Bool
    var saudeContador: Int
    
    // Serve para manter a energia do Baby ajudar na saúde
    // mas se exagerar pode acabar prejudicando a saúde
    // (>= 70 ou <= 30  já começa a prejudicar a saúde)
    var alimentacaoStatus: Int
    
    // Sinalizar se Baby está ou nao higienizado que será definido pelo
    // higieneContador  (>= 60 é porque o Baby está sujo)
    // alimentacaoStatus tambem pode sinalizar higieneStatus
    // alimentacaoStatus (>= 70 é porque o Baby está sujo)
    var higieneStatus: Bool
    var higieneContador: Int

    //sonoStatus Serve para sinalizar que o baby está com sono
    //dormindoStatus Serve para sinalizar quando baby estiver dormindo
    // e quem vai determinar essas anteriores é a energia
    var sonoStatus: Bool
    var dormindoStatus: Bool
    var energia: Int
    
    // Aqui fica armazenado os alimentos
    var geladeira = Array<Mercadoria>()
    // Aqui fica armazenado os remedios
    var farmacia = Array<Mercadoria>()
    
    // Nessa está concentrada a maioria de todas as out
    var prints: BabyPrints
    
    // Esse representa o dinheiro para efetuar compras de produtos \
    var dinheiro: Double
//-------------------------------------------------------------------------

    
 //Inicialização do Baby
    /*
     saude do Baby 100%
     nutricao do baby(alimentacaoStatus) 50 %
     higiene otima
     Energia total
        - Sem sono
     e com 100 R$ para gastar
     */
//-------------------------------------------------------------------------
    init(){
        self.saudeStatus = true
        self.saudeContador = 100

        self.alimentacaoStatus = 50

        self.higieneStatus = true
        self.higieneContador = 0

        self.sonoStatus = false
        self.dormindoStatus = false
        self.energia = 100
      
        
        self.prints = BabyPrints()
        self.dinheiro = 100.0
    }
//-------------------------------------------------------------------------

    func ganharDinheiro (){
        _ = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { timer in
            self.dinheiro += 10.0
        }
    }

    // Alimentar o Baby
//-------------------------------------------------------------------------

    func alimentar(_ idAlimento: Int){
// vamos verificar se ele nao estar totalmente cheio
        //+++++++++++++++++++++++++++++++
      let ben = self.geladeira[idAlimento].beneficio
      if self.alimentacaoStatus == 100 || (self.alimentacaoStatus + ben) > 100{
        print("""
-------------------------------------------------------------
|        Nao pode o alimentar pois ele esta' cheio          |
-------------------------------------------------------------
""")
        return
      }
        //+++++++++++++++++++++++++++++++
        
    // Agora vamos verficao
        /*
         Se nutricao <= 70 adiciona 2 para higiene
            alem de adicionar 3 para saude
         Caso seja maior que 70
            adiciona 10 pata higiene
            diminuir 3 para saude
         
         */
        //*******************************
      self.alimentacaoStatus += ben
        if self.alimentacaoStatus <= 70 {
      
          if self.higieneContador + 2 <= 100{
            self.higieneContador += 2
          }else{
            self.higieneContador = 100
          }
        
          if self.saudeContador + 3 <= 100{
            self.saudeContador += 3
          }else{
            self.saudeContador = 100
          }
        }else{
            if self.higieneContador + 10 <= 100{
            self.higieneContador += 10
          }
            if self.saudeContador - 3 >= 0{
              self.saudeContador -= 3
            }else{
              self.saudeContador = 0
            }

        }
        //***********************************
        
        // adionaremos energia
        if self.energia + 10 <= 100{
            self.energia += 10
        }else{
            self.energia = 100
        }
        
        //verificar como ta a saude e a higiene do baby
        verificar_saude()
        verificar_higiene()
        // como o alimento foi consumido com sucesso
        // temos que o tirar da geladeira
        self.geladeira.remove(at: idAlimento)
    }
//-------------------------------------------------------------------------


    //Medicar o Baby
    //O intuito tbm é que diminua a saude em relacao ao tempo 1s/ 1 de saude
//-------------------------------------------------------------------------
    func medicar(_ idRemedio: Int){
        // vamos verificar se ele nao estar com saude 100%
        //+++++++++++++++++++++++++++++++
      let ben = self.farmacia[idRemedio].beneficio
      if self.saudeContador == 100 || (self.saudeContador + ben) > 100{
        print("""
-------------------------------------------------------------
|    Nao pode o medicar pois ele esta' com otima saude       |
-------------------------------------------------------------
""")
        return
      }
        //+++++++++++++++++++++++++++++++
        
        // vamos auemtar um pouco a energia do baby
      self.saudeContador += ben
      if self.energia + 2 <= 100{
          self.energia += 2
      }else{
          self.energia = 100
      }
        verificar_saude()
      self.farmacia.remove(at: idRemedio)

    }
//-------------------------------------------------------------------------

    //Limpar o Baby
//-------------------------------------------------------------------------
    
    func limpar(){
        self.prints.limpar()
        self.higieneContador = 0
        self.higieneStatus = true
    }
//-------------------------------------------------------------------------
    

    // Colocar o Baby para Dormir ou Acordar
    // O intuito tbm é que aumente a energia em relacao ao tempo 1s/ 1 de energia
//-------------------------------------------------------------------------
    func dormir(){
        // Se ele estiver 100% de ebergia nao precisa dormir
        //ou se ele ja tiver dormindo e chegar a 100% o acorda
        
        if self.energia == 100 {
            if self.dormindoStatus == true{
                self.dormindoStatus = false
                self.prints.ligarLuz()
            }else{
                print("""
-------------------------------------------------------------
|Nao pode colocar para dormir pois a energia dele estar 100%|
-------------------------------------------------------------
""")
            }
        }else{
                // Caso esteja acordado colcar para dormir
                self.dormindoStatus = true
                self.prints.dormindo_print()
                /*
                 // essa parte nao foi possível ser adicionado nessa primeira versao
                 _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { myTimer in
                    self.energia = 100
                    print("Sonim bom!")
                }*/
                // entao ficou decido colocar 50 de energia a cada vezes que ele dormir
                if self.energia + 50 <= 100{
                    self.energia += 50
                }else{
                    self.energia = 100
                }

            }
        }
    }
//-------------------------------------------------------------------------
    
//-------------------------------------------------------------------------
    func verificar_higiene(){
        if(self.higieneContador >= 60 || self.alimentacaoStatus >= 70){
        self.higieneStatus = false
        }else{
            self.higieneStatus = true
        }
    }
//-------------------------------------------------------------------------
    
//-------------------------------------------------------------------------
    func verificar_saude(){
        if(self.saudeContador <= 30){
            self.saudeStatus = false
        }else{
            self.saudeStatus = true
        }
    }
//-------------------------------------------------------------------------
    
//-------------------------------------------------------------------------
    func verificar_energia(){
        if(self.energia <= 40){
            self.sonoStatus = true
        }else{
            self.sonoStatus = false
        }
    }
//-------------------------------------------------------------------------
    
//-------------------------------------------------------------------------
    func addAlimentoGel(_ ali: Mercadoria){
        self.geladeira.append(ali)
    }
//-------------------------------------------------------------------------
    
//-------------------------------------------------------------------------
    func addRemedioFar(_ re: Mercadoria){
        self.farmacia.append(re)
    }
//-------------------------------------------------------------------------
    
    //Estado do Baby
//-------------------------------------------------------------------------
    func estado(){
        if self.dormindoStatus {
            self.prints.dormindo_print()
            return
        }
        if self.sonoStatus{
            self.prints.sono_print()
        }
        if self.alimentacaoStatus <= 30 {
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
            
                prints.babySujo()
            }else if self.saudeStatus == false{
                print(prints.baby_doente)
            }else{
                print(prints.baby_normal)
            }
        }
    }
//-------------------------------------------------------------------------
    
    //jogar
    // vai diminuir a energia
    // e como bonus vai ganhar dinheiro
//-------------------------------------------------------------------------
    func jogar(){
        if self.energia == 0{
            print("""
----------------------------------------
|NAO PODE JOGAR POIS A ENERGIA ESTÁ 0 %|
----------------------------------------
""")
            self.verificar_energia()
            return
        }else if self.energia - 10 >= 0{
            if self.energia <= 40 {
                if self.saudeContador - 10 >= 0{
                    self.saudeContador -= 10
                }else{
                    self.saudeContador = 0
                }
            }
            self.energia -= 10
        }else{
            self.energia = 0
            if self.saudeContador - 10 >= 0{
                self.saudeContador -= 10
            }else{
                self.saudeContador = 0
            }
        }
        self.alimentacaoStatus -= 2
        self.dinheiro += 3.0
        self.verificar_saude()
        self.verificar_energia()
    }
//-------------------------------------------------------------------------
    
    // para verificar a mudança do tempo
    // e as maneiras q ele mofica os outros atributos do Baby
    func verificacao_tempo(){
        
    }
}
