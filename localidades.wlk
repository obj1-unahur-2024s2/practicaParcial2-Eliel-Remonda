import personajes.*

class Localidad{
    var ejercito
    method potencialDefensivo() {
        return ejercito.potencialTotal()
    }
    method serOcupada(unEjercito)
}

class Aldesas inherits Localidad{
    const property cantMaximaHabitantes
    override method serOcupada(unEjercito){
        if (unEjercito.size() > cantMaximaHabitantes){
            ejercito = unEjercito.nuevoEjercitoFuerte(10)
        } 
    }
}

class CiudadesGrandes inherits Localidad{
    override method potencialDefensivo(){
        return super() + 300
    }
    override method serOcupada(unEjercito){
        ejercito = unEjercito
    }
}

class Ejercito {
    const property personajes = []
    method potencialTotal(){
        return personajes.sum({ p => p.potencialOfensivo()})
    }
    method puedeTomarLocalida(unaLocalidad){
        return self.potencialTotal() > unaLocalidad.potencialDefensivo()
    }

    method invadir(unaLocalidad){
        if self.puedeTomarLocalida(unaLocalidad){
            unaLocalidad.serOcupada(self)
        }
    }
    method nuevoEjercitoFuerte(unaCantidad){
        const nuevoEjercito = personajes.sortBy({p1, p2 => p1.potencialOfensivo() > p2.potencialOfensivo()}).take(unaCantidad)
        personajes.removeAll(nuevoEjercito)
        return new Ejercito (personajes = nuevoEjercito
        )    
    }
}