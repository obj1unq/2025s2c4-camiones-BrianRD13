// Las cosas
object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	var property peso = 0

	method nivelPeligrosidad() = 1

	method cambiarPeso(nuevoPeso) {
		peso = nuevoPeso
	}
}

object bumblebee {
	var property peligrosidad = false 
	
	method peso() = 800 

	method nivelPeligrosidad() {
		if (peligrosidad) {
			return 30
		} else {
			return 15
		}		
	}
	method transformarse() {
		if (peligrosidad) {
			peligrosidad = false
		} else {
			peligrosidad = true
		}
	}
}

object paqueteDeLadrillos {
	var property ladrillos = 0

	method peso() = ladrillos * 2
	method nivelPeligrosidad() = 2

	method agregarLadrillos(cantidad) {
		ladrillos = ladrillos + cantidad
	} 	
}

object bateriaAntiaerea {
	var property conMisiles = false 

	method peso() {
		if (conMisiles) {
			return 300
		} else {
			return 200
		}
	}

	method nivelPeligrosidad() {
		if (conMisiles) {
			return 100
		} else {
			return 0
		}
	}

	method cambiarEstado() {
		if (conMisiles) {
			conMisiles = false
		} else {
			conMisiles = true
		}
	}
}

object residuosRadiactivos {
	var property peso = 0

	method nivelPeligrosidad() = 200

	method cambiarPeso(nuevoPeso) {
		peso = nuevoPeso
	}
}

// Más cosas
object contenedorPortuario {
	var property cosas = #{}

	method peso() {
		var pesoTotal = 100
		cosas.forEach{ unaCosa => pesoTotal += unaCosa.peso() }
		return pesoTotal
	}

	method nivelPeligrosidad() {
		if (cosas.isEmpty()) {
			return 0
		}
		return cosas.map{ unaCosa => unaCosa.nivelPeligrosidad() }.max()
	}
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = null

	method peso() {
		if (cosaEnvuelta != null) {
			return cosaEnvuelta.peso()
		}
		return 0
	}

	method nivelPeligrosidad() {
		if (cosaEnvuelta != null) {
			return cosaEnvuelta.nivelPeligrosidad() / 2
		}
		return 0
	}

	method envolver(unaCosa) {
		cosaEnvuelta = unaCosa
	}
}