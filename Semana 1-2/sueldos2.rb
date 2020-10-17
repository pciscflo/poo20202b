class Trabajador
	def initialize(dni, nombre, apellido, sueldobase, tipotrabajador)
		@dni = dni
		@nombre = nombre
		@apellido = apellido
		@sueldobase = sueldobase
		@tipotrabajador = tipotrabajador
	end
	def calcularbono
	    bono = 0
		if @tipotrabajador == "Planilla" 
			bono = 300
		elsif @tipotrabajador == "Por Horas"
			bono = 400
		else 
			bono = 500
		end
		return bono
	end
	 def calcularsueldo
	 	return @sueldobase + calcularbono
	 end
	end

	trabajador1 = Trabajador.new(47809644, "Frank", "Medina", 3000, "Planilla")
	puts trabajador1.calcularsueldo
