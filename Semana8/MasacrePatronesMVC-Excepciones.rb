require 'singleton'
class Participante
	attr_reader :nombre, :apellido, :dni, :edad, :mensajesTexto
	def initialize(nombre, apellido, dni, edad, mensajesTexto)
		@nombre=nombre
		@apellido=apellido
		@dni= dni
		@edad=edad
		@mensajesTexto=mensajesTexto
	end
  def validarEdad
    if edad<18 
      raise "No esta permitido menores de edad."
    end
    return true
  end
	def calcularPuntaje
		return mensajesTexto*4
	end
end
class FanMasacre < Participante
	attr_reader :equipo, :puntajeBarra, :puntajeEquipo
	def initialize(nombre, apellido, dni, edad, mensajesTexto, equipo, puntajeBarra, puntajeEquipo)
		super(nombre, apellido, dni, edad, mensajesTexto)
		@equipo=equipo
		@puntajeBarra=puntajeBarra
		@puntajeEquipo=puntajeEquipo
	end
	def calcularPuntaje
		super + puntajeBarra + puntajeEquipo*2
	end
end
class Televidente < Participante
	attr_reader :numeroTelefono, :cantidadLlamadas
	def initialize(nombre, apellido, dni, edad, mensajesTexto, numeroTelefono, cantidadLlamadas)    
	   super(nombre, apellido, dni, edad, mensajesTexto)             
       @numeroTelefono=numeroTelefono
       @cantidadLlamadas = cantidadLlamadas		
	end
	def calcularPuntaje
		super + cantidadLlamadas*3
	end
end

class Administrador # Modelo
   include Singleton
   attr_reader :arregloParticipantes
   def initialize
   	  @arregloParticipantes = []   	  
   end
   def registrar(participante)
       if participante.validarEdad
   	      arregloParticipantes.push(participante)
       end
   end

   def buscarParticipante(dni)
   	for participante in arregloParticipantes
   		if participante.dni == dni
   			return participante
   		end
   	end
   	return nil
   end

   def listarParticipantes
   	puts "---------------------"
   	  for participante in arregloParticipantes
   	  	puts "#{participante.nombre}   #{participante.dni} #{participante.calcularPuntaje}"
   	  end
   end

end

class Factory
	def self.generarObjeto(tipo, *arg)
       case tipo
       	   when "fm"
       	   	  FanMasacre.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7])
       	   when "tv"
       	   	  Televidente.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6])
       	end 	
	end
end

class Vista
   def mostrar(mensaje)
   	 puts mensaje
   end
   def mostrarExcepcion(mensaje)
    puts mensaje
   end
   def mostrarListado(arreglo)
      puts "------Listado------------"
   	  for participante in arreglo
   	  	puts "#{participante.nombre}   #{participante.dni} #{participante.calcularPuntaje}"
   	  end
   end
   def muestraDatosParticipante(participante)
   	puts "Resultado de Busqueda:"
      if participante!=nil
      	 puts "#{participante.nombre} #{participante.apellido} #{participante.calcularPuntaje}"
      else
      		puts "Participante no encontrado!"
      end
   end

end

class Controlador
	attr_reader :vista, :modelo 
	def initialize(vista, modelo)
		@vista=vista
		@modelo = modelo
    end
    def registrar(tipo, *arg)
    	concursante = Factory.generarObjeto(tipo,*arg)
      begin
    	   modelo.registrar(concursante)      
    	   vista.mostrar("Concursante registrado")
      rescue Exception => e
         vista.mostrarExcepcion(e.message)
      end
    end
    def listarParticipantes
         arreglo = modelo.arregloParticipantes
         vista.mostrarListado(arreglo)
    end
    def buscarParticipante(dni)
    	participante = modelo.buscarParticipante(dni)
    	vista.muestraDatosParticipante(participante)
    end
end
# Pruebas

vista = Vista.new
adm = Administrador.instance
controlador = Controlador.new(vista, adm)
controlador.registrar("fm","Carlos", "Carpio", "88888888", 14, 50, "nuclear", 100, 70)
controlador.registrar("tv","Pedro", "Solar", "77777777", 28, 100, 5033435, 70)
controlador.listarParticipantes ## TDD
controlador.buscarParticipante("77777777")

