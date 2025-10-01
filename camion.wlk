import cosas.*

object camion {
	const property cosas = #{}

	method todoPesoPar() {
		return cosas.all{ unaCosa => unaCosa.peso() % 2 == 0 }
	}
		
	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			 console.println("No se puede cargar una cosa ya cargada")
		} else {
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			console.println("No se puede descargar una cosa que no está cargada")
		} else {
			cosas.remove(unaCosa)
		}
	}
}