import wollok.game.*

object hector {
	var property cultivos
	var property monedas
	var property position = game.at(1,1)
	var property image = "player.png"
	
	method movete(posicion){
		position = posicion
	}
	method sembrar(cultivo){
		game.addVisualIn(cultivo, position)
	}
	method regar(_cultivos){
		_cultivos.forEach({ cultivo => cultivo.seRegadoPor(position) })
	}
	method cosechar(cultivo){
		
	}
	method venderCultivo(){
		
	}
}
