import Foundation

// Esse é o mundo do Tamagotchi
var teste = World()

/* Barra de Status do Tamagotchi
 em que será mostrado a Energia e a Nutrição dele
*/
//---------------------------------------------------------------
func status(){
     print("""
                                                       
--------------------------------------------------------
        Energia - \(teste.tamagotchi.energia)
        Nutrição - \(teste.tamagotchi.alimentacaoStatus)
        Saúde - \(teste.tamagotchi.saudeContador) %
        Dinheiro - \(teste.tamagotchi.dinheiro) R$
--------------------------------------------------------

""")
}
//---------------------------------------------------------------



/* Estamos deixando o mercado previamente abastecido
para o bom funcionamento do jogo
 */
//-----------------------------------------------------------
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

//-------------------------------------------------------------



// Menu Principal do Tamagotchi
/* Aqui você poderá:
 alimentar
 medicar
 limpar
 colocar para dormir ou acordar
 comprar suprimentos e remedios
 brincar
 com seu Tamagotchi
 */
//---------------------------------------------------------------
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
                if teste.tamagotchi.dormindoStatus {
                    if entrada == 0 || entrada < 0 || entrada > 2{
                        entrada = 0
                        teste.invalidoPrint()
                    }else{
                        if entrada == 1 {
                            dorAcor()
                        }else{
                            entrada = 7
                        }
                    }
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
                    case 7:
                        print("Até mais!")
                    default:
                        print("OPs")
                    }
                
                }
                
            }
        }
    }while entrada != 7
}
//---------------------------------------------------------------


// Geladeira do Tamagotchi
// Aqui onde fica armazenado todos os alimentos
//---------------------------------------------------------------
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
//---------------------------------------------------------------


// Farmacia
// Aqui onde fica armazenado todos os remedios
//---------------------------------------------------------------
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
//---------------------------------------------------------------


// Essa função serve para banhar o tamagotchi
//---------------------------------------------------------------
func limpar(){
    teste.tamagotchi.limpar()
    teste.tamagotchi.estado()
    status()
}
//---------------------------------------------------------------


// Essa função serve para fazer acordar/dormir o tamagotchi
//---------------------------------------------------------------
func dorAcor(){
    teste.tamagotchi.dormir()
    teste.tamagotchi.estado()
    status()
}
//---------------------------------------------------------------


// Essa função permite que você reabasteca a geladeira ou/e
// a farmacia
//---------------------------------------------------------------
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
//---------------------------------------------------------------

func jogar(){
    teste.tamagotchi.jogar()
    teste.tamagotchi.estado()
    status()
}
menuP()
