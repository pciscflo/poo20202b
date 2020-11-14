class Boleta
	def initialize(codigo,fecha, nombreFuncion, precio)
		@codigo,@fecha,@nombreFuncion,@precio = codigo,fecha,nombreFuncion,precio
	end

	def calcularIgv()
		return @precio * 0.18 
	end	

	def calucarVenta()
		return @precio + calcularIgv()
	end

	def obtenerCodigo
		return @codigo
	end
	def obtenerNombrefuncion
		return @nombreFuncion
	end	

	def obtenerFecha
		return @fecha
	end


end
 boleta = Boleta.new('MA255', 21/10/2020, 'estreno', 15)
 puts boleta.obtenerCodigo
 puts boleta.obtenerNombrefuncion
 puts boleta.obtenerFecha
 puts boleta.calucarVenta


