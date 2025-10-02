import cosas.*
class UserException inherits wollok.lang.Exception {}

object camion {
	const property cosas = #{}

	method objetoConPeso(pesoDado) {
		return cosas.any{ unaCosa => unaCosa.peso() == pesoDado }
	}

	method todoPesoPar() {
		return cosas.all{ unaCosa => unaCosa.peso() % 2 == 0 }
	}
		
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