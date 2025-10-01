import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)) {
			throw "No se puede cargar una cosa ya cargada"
		} else {
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			throw "No se puede descargar una cosa que no está cargada"
		} else {
			cosas.remove(unaCosa)
		}
	}
}