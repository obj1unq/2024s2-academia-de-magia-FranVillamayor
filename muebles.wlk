class Mueble {
    const property cosas = #{}

    method remover(cosa) {
        cosas.remove(cosa)
    }

    method cosaMenosUtil() {
        return cosas.min({cosa => cosa.utilidad()})
      
    }

    method utilidad() {
        return self.utilidadDeLasCosas() / self.precio()
    }

    method precio()

    method utilidadDeLasCosas() {
        return cosas.sum({cosa => cosa.utilidad()})
    }

    method agregar(cosa) {
        cosas.add(cosa)
    }

    method puedeGuardar(cosa)
    method tiene(cosa) {
        return cosas.contains(cosa)
    }
}

class Armario inherits Mueble {
    var property cantidadMaxima

    override method precio(){
        return 5 * cantidadMaxima
    }

    override method puedeGuardar(cosa){
        return cosas.size() < cantidadMaxima
    }
}

class GabineteMagico inherits Mueble {
    const property precio
    override method puedeGuardar(cosa) {
        return cosa.esMagico()
    }
  
}

class Baul inherits Mueble {
    const property volumenMaximo

    override method utilidad(){
        return super() + self.extraPorTodasReliquias()
    }

    method extraPorTodasReliquias() {
        return if(self.todasSonReliquias()){2}else{0}
    }

    method todasSonReliquias() {
        return cosas.all({cosa => cosa.esReliquia()}) 
    }

    override method precio(){
        return volumenMaximo + 2
    }

    override method puedeGuardar(cosa){
        return cosa.volumen() + self.volumen() < volumenMaximo
    }

    method volumen() {
        return cosas.sum({cosa => cosa.volumen()})
    }
  
}

class BaulMagico inherits Baul {

    override method precio(){
        return super() * 2
    }

    override method utilidad() {
        return super() + self.cantidadDeElementosMagicos()
    }

    method cantidadDeElementosMagicos() {
        return cosas.count({cosa => cosa.esMagico()})
    }
  
}