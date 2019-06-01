import wollok.game.*
import hector.*

class Cultivos{
	method seCultivado(posicion) {
		if(self.estaListoParaCosecha()){
			hector.nuevoCultivo(self)
			game.removeVisual(self)
		}
	}
	method estaListoParaCosecha(){return false} 
		
}



class Maiz inherits Cultivos {

	var property esBebe = true

	method image() = if (esBebe) {
		"corn_baby.png"
	} else {
		"corn_adult.png"
	}

	method seRegado(posicion) {
		self.esBebe(false)
	}
	override method estaListoParaCosecha(){
		return not esBebe
	} 
	method precio() {
		return 150
	}

}

class Trigo inherits Cultivos {

	var property etapaDeEvolucion = 0

	method image() = "wheat_" + etapaDeEvolucion + ".png"

	method seRegado(posicion) {
		self.evolucionar()
	}
	method evolucionar() {
		if (etapaDeEvolucion != 3) {
			etapaDeEvolucion += 1
		} 
		else { etapaDeEvolucion = 0 }
	}
	override method estaListoParaCosecha(){
		return etapaDeEvolucion >= 2
	} 
	method precio() {
		return (etapaDeEvolucion - 1) * 100
	}

}

class Tomaco inherits Cultivos {

	method image() = "tomaco.png"

	method seRegado(posicion) {
		if(posicion.y() != 9 ){
			self.moverseArriba(posicion)
		}
		else { self.irAlFinal(posicion) }
	}
	method moverseArriba(posicion){
			game.removeVisual(self)
			game.addVisualIn(self, posicion.up(1))
	}
	method irAlFinal(posicion){
		game.removeVisual(self)
		game.addVisualIn(self, game.at(posicion.x(),0))
	}
	override method estaListoParaCosecha(){
		return true
	}
	method precio() {
		return 80 
	}
	
}















