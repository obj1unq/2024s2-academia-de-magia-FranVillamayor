class Cosa {
    const property volumen
    const property marca
    const property esMagico
    const property esReliquia

    method utilidad() {
        return volumen + self.extraPorMagico() + self.extraPorReliquia() + marca.aporte(self)
    }

    method extraPorMagico() {
        return if(esMagico){3}else{0}
    }

    method extraPorReliquia() {
        return if(esReliquia){5}else{0}
    }
  
}

object cuchuflito {
    method aporte(cosa) {
        return 0
    }
  
}

object acme {
    method aporte(cosa) {
        return cosa.volumen()/2
    }
  
}

object fenix {
    method aporte(cosa) {
        return if(cosa.esReliquia()){3}else{0}
    } 
}