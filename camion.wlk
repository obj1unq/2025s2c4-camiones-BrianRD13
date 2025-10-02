import cosas.*

object camion {
	const property cosas = #{}

	method objetoConPeligrosidad(nivelPeligrosidad) {
		return cosas.find{ unaCosa => unaCosa.nivelPeligrosidad() == nivelPeligrosidad }
	}

	method peso() {
		var pesoTotal = 1000
		cosas.forEach{ unaCosa => pesoTotal += unaCosa.peso() }
		return pesoTotal
	}

	method excedidoDePeso() {
		return self.peso() > 2500		
	}

	method objetoConPeso(pesoDado) {
		return cosas.any{ unaCosa => unaCosa.peso() == pesoDado }
	}

	method todoPesoPar() {
		return cosas.all{ unaCosa => unaCosa.peso() % 2 == 0 }
	}
		
	method cargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			cosas.remove(unaCosa)
		}
	}
}