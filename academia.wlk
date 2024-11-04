class Academia{
	const property muebles = #{}

	method quitarMueble(mueble) {
		muebles.remove(mueble)
	}

	method removerCosasMenosUtilesNoMagicas() {
		self.validarRemover()
		self.cosasMenosUtiles().filter({cosa => not cosa.esMagico()}).forEach({cosa => self.remover(cosa)})	
	}

	method validarRemover() {
		if(muebles.size() < 3){
			self.error("No puede remover nada necesita al menos que haya 3 muebles")
		}
	  
	}

	method remover(cosa) {
		self.muebleDondeEsta(cosa).remover(cosa)
	}

	method marcaCosaMenosUtil() {
		return self.cosasMenosUtiles().min({cosa => cosa.utilidad()}).marca()
	}

	method cosasMenosUtiles() {
		return muebles.map({mueble => mueble.cosaMenosUtil()})
	}

	method guardar(cosa) {
		self.validarGuardar(cosa)
		self.guardarEnMuebleDisponible(cosa)
	}

	method guardarEnMuebleDisponible(cosa) {
		self.muebleDondeGuardar(cosa).anyOne().agregar(cosa)
	}

	method validarGuardar(cosa) {
		if(not self.sePuedeGuardar(cosa)){
			self.error("No se puede guardar " + cosa)
		}
	}

	method muebleDondeGuardar(cosa) {
		return muebles.filter({mueble => mueble.puedeGuardar(cosa)})
	}

	method sePuedeGuardar(cosa) {
		return not self.estaGuardada(cosa) && self.hayMuebleDisponiblePara(cosa) 
	}

	method hayMuebleDisponiblePara(cosa) {
		return muebles.any({mueble => mueble.puedeGuardar(cosa)})
	}
	
	method estaGuardada(cosa) {
		return muebles.any({mueble => mueble.tiene(cosa)})
	}

	method muebleDondeEsta(cosa) {
		return muebles.find({mueble => mueble.tiene(cosa)})
	}
	//saber si está guardado algo
}
