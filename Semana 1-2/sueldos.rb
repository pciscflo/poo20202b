=begin 
Una empresa desea poder calcular el bono para sus trabajadores.
Los trabajadores se registran con su DNI, nombre, apellido, sueldo
base y tipo de trabajador. Los trabajadores pueden ser "Planilla",
"Por Horas", "Parcial". En el caso de los trabajadores de Planilla
su sueldo es el sueldo base más 300 soles de bono, en el caso de
Por Horas son 400 soles de bono y en el otro caso 500 soles de bono.
Desarrollar el programa que permita calcular el sueldo del trabajador
neto. Imprimir su boleta de pago.
=end

class Trabajador
	attr_reader :apellido #permite acceder a apellido por afuera directamente x medio de su objeto
	def initialize(dni, nombre, apellido, sueldo_basico, tipo_trabajador)
		@dni = dni
		@nombre = nombre
		@apellido = apellido
		@sueldo_basico = sueldo_basico
		@tipo_trabajador = tipo_trabajador
	end

	def obtenerNombre
		return @nombre
	end
	def obtenerDni
		return @dni
	end

	def calcularBono()
		case @tipo_trabajador
		when "Planilla"
			return 300
		when "Por Horas"
			return 400
		when "Parcial"
			return 500
		end
	end
	def calcularSueldo()
		return @sueldo_basico+calcularBono()
	end
end
trabajador = Trabajador.new(46770637, "Luis", "Arana", 9000, "Por Horas")
puts "Nombre:#{trabajador.obtenerNombre}"
puts "DNI: #{trabajador.obtenerDni}"
puts "Apellido:#{trabajador.apellido}"
puts "Bono: #{trabajador.calcularBono}"
puts "Sueldo: #{trabajador.calcularSueldo}"

