class Alumno #nombre de la clase debe iniciarse en mayuscula
	def initialize(codigo, nombre, nota1, nota2) #las propiedades de una clase están encapsuladas
		@codigo = codigo
		@nombre = nombre
		@nota1 = nota1
		@nota2 = nota2
	end

	def calcularPromedio #nombre de metodos se inicia en minuscula
        return (@nota1 + @nota2) /2.0
	end
	def obtenerNombre
		return @nombre
	end
	def actualizarNombre(nuevoNombre)
		@nombre = nuevoNombre
	end
end
#pantalla , testing , pruebas
alumno1 = Alumno.new("u20293940","Luis",18, 20)
puts alumno1.calcularPromedio
puts alumno1.obtenerNombre #Luis
alumno1.actualizarNombre("Carlos")
puts alumno1.obtenerNombre #Carlos

alumno2 = Alumno.new("u2203044", "Carmen", 15, 16)
puts alumno2.calcularPromedio







