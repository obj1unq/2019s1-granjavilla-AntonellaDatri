import wollok.game.*

object hector {
	var property cultivos = []
	var property monedas = 0
	var property position = game.at(1,1)
	var property image = "player.png"
	
	method movete(posicion){
		position = posicion
	}
	method sembrar(cultivo){
		game.addVisualIn(cultivo, position)
	}
	method regar(_cultivos){
		self.verificarSiHayCultivosParaRiego(_cultivos)
		_cultivos.forEach({ cultivo => cultivo.seRegado(position) })
		
	}
	method  verificarSiHayCultivosParaRiego(_cultivos){
		if(_cultivos == null){
			game.error("no tengo nada para regar")
		}
	}
	method cosechar(_cultivos){
		self.verificarSiHayCultivosParaCosecha(_cultivos)
		_cultivos.forEach({ cultivo => cultivo.seCultivado(position) })
	}
	method  verificarSiHayCultivosParaCosecha(_cultivos){
		if(_cultivos == null){
			game.error("no tengo nada para cosechar")
		}
	}
	method nuevoCultivo(cultivo){
		cultivos.add(cultivo)
	}
	method venderCultivo(){
		monedas += self.presioDeVentaDeCultivos()
		cultivos = []
	}
	method presioDeVentaDeCultivos(){
		return cultivos.map({ cultivo => cultivo.precio() }).sum()
	}
	method gananciasAlVender(){
		game.say(self, "tengo " + monedas + " monedas y " + self.cantidadDeCultivosParaVender() + " plantas para vender" )
	}
	method cantidadDeCultivosParaVender(){
		return cultivos.size()
	}
}









