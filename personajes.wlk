class Personaje{
    const property ejercito = [] 
    var rol
    const property fuerza
    const property inteligencia = false
    method rol() = rol
    method cambiarDeRol(unRol){
        rol = unRol
    }
    method fuerza() = fuerza
    method inteligencia() = inteligencia
    method potencialOfensivo() {
        return fuerza * 10 + rol.extra()
    }
    method esInteligente()
    method esGroso() {
        return self.esInteligente() or self.esGrosoEnSuRol()
    }
    method esGrosoEnSuRol() {
        return rol.esGroso(self)
    }
}

class Orcos inherits Personaje{
    override method potencialOfensivo() {
        return super() * 1.10
    }
    override method esInteligente() = false
}

class Humanos inherits Personaje{
    override method esInteligente(){
        return inteligencia > 50
    }
}

class Rol {
    method extra()
    method esGroso(unPersonaje)
}
object guerrero inherits Rol{
    override method extra() = 100
    override method esGroso(unPersonaje) {
        unPersonaje.fuerza() > 50
    }
}

class Cazador inherits Rol{
    var property mascota
    override method extra() = mascota.extra()
    override method esGroso(unPersonaje) {
        mascota.esLonjeva()
    }
}

object brujo inherits Rol{
    override method extra() = 0
    override method esGroso(unPersonaje) = true
}

class Mascota{
    const property fuerza
    var edad
    var property tieneGarras
    method edad() = edad
    method aumentarEdad(){
        edad += 1
    }
    method extra() = if (self.tieneGarras()) {fuerza * 2} else {fuerza}
    method esLonjeva(){
        return edad > 10
    }
}