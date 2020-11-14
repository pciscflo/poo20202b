class Universidad
	attr_reader :arregloEstudiantes, :nombre
	def initialize(nombre)
		@arregloEstudiantes = []
        @nombre = nombre
	end
	def registrar(estudiante)
		arregloEstudiantes.push(estudiante)
	end
    def listarEstudiantes
    	for estudiante in arregloEstudiantes
    		puts "-------ALUMNO---------"
    		puts "#{estudiante.dni}   #{estudiante.nombres} "
    		puts  "---------------"
    		for pago in estudiante.arregloPagos
    			if pago.estado=="pagado"
                   puts "#{pago.codigo} #{pago.concepto} #{pago.monto}"
               end
    		end
    		puts "----------------"
    	end
    end
end
class Estudiante
	attr_reader :codigo, :dni,:nombres, :carrera, :arregloPagos
	def initialize(codigo,dni, nombres, carrera)
       @codigo, @dni, @nombres, @carrera = codigo,dni, nombres, carrera
       @arregloPagos = []
	end
	def registrar(pago)
		arregloPagos.push(pago)
	end
end
class Pago
   attr_reader :codigo, :concepto, :fecha, :monto, :estado
   def initialize(codigo, concepto, fecha, monto, estado)
   	 @codigo, @concepto, @fecha, @monto, @estado = codigo, concepto, fecha, monto, estado
   end
end

#pruebas
uni = Universidad.new("UPC")
e1 = Estudiante.new("202030495","88888888", "Luis Perez", "Sistemas")
pago1 = Pago.new("100", "Pension", "12/08/2020", 1000, "pagado")
pago2 = Pago.new("101", "Pension", "12/09/2020", 1000, "pagado")
pago3 = Pago.new("102", "Pension", "12/08/2020", 1000, "pendiente")
e1.registrar(pago1)
e1.registrar(pago2)
e1.registrar(pago3)
uni.registrar(e1)
e2 = Estudiante.new("202030885","99999999", "Carmen Robles", "Sistemas")
pago1 = Pago.new("145", "Pension", "12/07/2020", 2000, "pagado")
pago2 = Pago.new("146", "Pension", "12/04/2020", 2000, "pagado")
pago3 = Pago.new("147", "Pension", "12/09/2020", 2000, "pagado")
e2.registrar(pago1)
e2.registrar(pago2)
e2.registrar(pago3)
uni.registrar(e2)
uni.listarEstudiantes



