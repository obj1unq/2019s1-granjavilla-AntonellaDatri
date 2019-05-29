import wollok.game.*

class Maiz {

	var property esBebe = true

	method image() = if (esBebe) {
		"corn_baby.png"
	} else {
		"corn_adult.png"
	}

	method seRegadoPor(posicion) {
		self.esBebe(false)
	}

}

class Trigo {

	var property etapaDeEvolucion = 0

	method image() = "wheat_" + etapaDeEvolucion + ".png"

	method seRegadoPor(posicion) {
		self.evolucionar()
	}

	method evolucionar() {
		if (etapaDeEvolucion != 3) {
			etapaDeEvolucion += 1
		} 
		else { etapaDeEvolucion = 0 }
	}

}

class Tomaco {

	method image() = "tomaco.png"

	method seRegadoPor(posicion) {
		if(posicion.y() != 10 ){
			self.moverseArriba(posicion)
		}
		else { self.irAlFinal() }
	}
	method moverseArriba(posicion){
			game.removeVisual(self)
			game.addVisualIn(self, posicion.up(1))
	}
	method irAlFinal(){
		game.removeVisual(self)
		game.addVisualIn(self, posicion.up(1))
	}

}















