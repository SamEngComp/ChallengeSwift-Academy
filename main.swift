import Foundation

var teste = World()

func status(){
     print("""
                                                       
--------------------------------------------------------
        Energia - \(teste.tamagotchi.energia)
        hunger - \(teste.tamagotchi.alimentacaoStatus)
--------------------------------------------------------

""")
        
    }

let maca = Mercadoria("Maçã", 12, 1.3)
let banana = Mercadoria("Banana", 11, 1.0)
let manga = Mercadoria("Manga", 12, 1.5)

teste.loja.addAlimento(maca)
teste.loja.addAlimento(banana)
teste.loja.addAlimento(manga)

let dipirona = Mercadoria("Dipirona", 18, 2.3)
let ibuprofeno = Mercadoria("Ibuprofeno", 14, 2.5)
let dorflex = Mercadoria("Dorflex", 18, 2.0)

teste.loja.addRemedio(dipirona)
teste.loja.addRemedio(ibuprofeno)
teste.loja.addRemedio(dorflex)

func menuP(){
    teste.tamagotchi.estado()
    status()
var entrada = 0
    repeat{
        while(entrada >= 0 && entrada <= 6){
            teste.menu_principal()
            if let input = readLine(){
                if let aux = Int(input){
                    entrada  = aux
                }
            }
            if entrada == 0 || entrada < 0 || entrada > 7{
                entrada = 0
                teste.invalidoPrint()
            }else{
                
                switch entrada {
                case 1:
                    geladeira()
                    break
                case 2:
                    farmacia()
                    break
                case 3:
                    limpar()
                    break
                case 4:
                    dorAcor()
                    break
                case 5:
                    comprar()
                    break
                case 6:
                    jogar()
                    break
                default:
                    print("Ate' a proxima")
                }
                
                
                
            }
        }
    }while entrada != 7
}

func geladeira(){
    teste.menu_geladeira()
    
    if let input = readLine(){
        if let aux = Int(input){
            teste.tamagotchi.alimentar(aux)
            teste.tamagotchi.estado()
            status()
        }else{
            if input == "cp"{
                comprar()
            }else if input == "v"{
                menuP()
            }
        }
    }
    
}

func farmacia(){
    teste.menu_farmacia()
    
    if let input = readLine(){
        if let aux = Int(input){
            teste.tamagotchi.medicar(aux)
            teste.tamagotchi.estado()
            status()
        }else{
            if input == "cp"{
                comprar()
            }else if input == "v"{
                menuP()
            }
        }
    }
}

func limpar(){
    teste.tamagotchi.limpar()
}

func dorAcor(){
    teste.tamagotchi.dormir()
}

func comprar(){
    teste.menu_mercado()
    if let input = readLine(){
        if let aux = Int(input){
            teste.comprarMercadoria(aux)
            menuP()
        }else{
            if input == "mn"{
                menuP()
            }
        }
    }
}

func jogar(){
    
}

menuP()
