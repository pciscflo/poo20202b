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

class Administrador
   include Singleton
   attr_reader :arregloParticipantes
   def initialize
   	  @arregloParticipantes = []   	  
   end
   def registrar(participante)
   	arregloParticipantes.push(participante)
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

adm = Administrador.instance
fan1 = Factory.generarObjeto("fm","Carlos", "Carpio", "88888888", 24, 50, "nuclear", 100, 70)
tv1 = Factory.generarObjeto("tv","Pedro", "Solar", "77777777", 28, 100, 5033435, 70) 
adm.registrar(fan1)
adm.registrar(tv1)
adm.listarParticipantes
puts "----"
par = adm.buscarParticipante("77777777")
if par!=nil
   puts par.nombre
else
	puts "No existe"
end

