import cosas.*
class UserException inherits wollok.lang.Exception {}

// Camión de transporte
object camion {
	const property cosas = #{}

	// Puede circular en ruta
	method circularEnRuta() {
		return !self.excedidoDePeso() && self.objetosMasPeligrososQue(20).isEmpty()		
	}

	// Cosas peligrosas
	method objetosMasPeligrososQue(peligrosidad) {
		if (peligrosidad.isInteger()) {
			return cosas.filter{ unaCosa => unaCosa.nivelPeligrosidad() > peligrosidad }		
		}
		return cosas.filter{ unaCosa => unaCosa.nivelPeligrosidad() > peligrosidad.nivelPeligrosidad() }
	}

	// El de nivel
	method objetoConPeligrosidad(nivelPeligrosidad) {
		return cosas.find{ unaCosa => unaCosa.nivelPeligrosidad() == nivelPeligrosidad }
	}

	// Peso y exceso de peso
	method peso() {
		var pesoTotal = 1000
		cosas.forEach{ unaCosa => pesoTotal += unaCosa.peso() }
		return pesoTotal
	}

	method excedidoDePeso() {
		return self.peso() > 2500		
	}

	// Hay alguno que pesa
	method objetoConPeso(pesoDado) {
		return cosas.any{ unaCosa => unaCosa.peso() == pesoDado }
	}
	
	// Todo peso par
	method todoPesoPar() {
		return cosas.all{ unaCosa => unaCosa.peso() % 2 == 0 }
	}

	// Carga y descarga		
	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			throw new UserException(message = "No se puede cargar dos veces la misma cosa")
		}
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			 throw new UserException(message = "No se puede descargar una cosa que no esta en el camion")
			}
		cosas.remove(unaCosa)
	}
}