
class Profesor
   attr_reader :codigo, :nombre, :dni, :gradoAcademico, :anio

   def initialize(codigo, nombre, dni, gradoAcademico, año)
   	  @codigo = codigo
   	  @nombre = nombre
   	  @dni = dni
   	  @gradoAcademico = gradoAcademico
   	  @anio = anio
   end
   def validarNombre
      if nombre!=nil && nombre!=""
         return true
      end
      raise "Nombre no puede estar vacio, por lo tanto no se registra"
   end
   def calcularBono40 #esto no es polimorfismo
   	  if anio < 1980
   	  	return 200
   	  else
   	  	return 0
   	  end
   end
   def calcularSueldo #método polimorfico se implementa en las subclases respectivas
   end
   def dameTipo
   end
end
class ProfesorTC < Profesor
    attr_reader :sueldoFijo, :afp
    def initialize(codigo, nombre, dni, gradoAcademico, año, sueldoFijo, afp)
    	super(codigo, nombre, dni, gradoAcademico, año)
    	@sueldoFijo = sueldoFijo
    	@afp = afp
    end
    def calcularSueldo
    	sueldoFijo - afp*sueldoFijo
    end
    def dameTipo
      "TC"
    end
end
class ProfesorTP < Profesor
	attr_reader :tarifaHora, :horasTrabajadas
    def initialize(codigo, nombre, dni, gradoAcademico, año, tarifaHora, horasTrabajadas)
    	super(codigo, nombre, dni, gradoAcademico, año)
    	@tarifaHora = tarifaHora
    	@horasTrabajadas = horasTrabajadas
    end
    def calcularSueldo
    	tarifaHora*horasTrabajadas
    end
    def dameTipo
      "TP"
    end
end

class Administrador
   attr_reader :arregloProfesores
   def initialize
   	@arregloProfesores = []
   end
   def validarExistenciaDni(dni)
     for profesor in arregloProfesores
      if profesor.dni == dni
       raise "Existe un dni igual, no se puede registrarlo"
      end
     end
     return true
   end
   def registrar(profesor)
    if profesor.validarNombre && validarExistenciaDni(profesor.dni)
       arregloProfesores.push(profesor)
    end
   end
   def imprimirListado
   	  for profesor in arregloProfesores
   	  	puts "#{profesor.nombre}   #{profesor.calcularSueldo}"
   	  end
   end
   def imprimirListadoTipo(tipo)
      puts "-- LISTADO POR #{tipo} ---------"
      for profesor in arregloProfesores
        if profesor.dameTipo==tipo
           puts "#{profesor.nombre}   #{profesor.calcularSueldo}"
        end
      end
   end
   def obtenerProfesorGanaMas
      maximo = 0
      for profesor in arregloProfesores
        if profesor.calcularSueldo>maximo
          maximo = profesor.calcularSueldo
          profe = profesor
        end
      end
      return profe
   end
end
###############

ptc1 = ProfesorTC.new(1001, "Pepe" , 88888888, "Master", 1970, 2000, 0.12)
ptp1 = ProfesorTP.new(2004, nil, 99999999, "Bachiller", 1985, 60, 20)
ptp2 = ProfesorTP.new(2007, "Ana", 88888888, "Bachiller", 1985, 60, 20)
adm = Administrador.new
begin
   adm.registrar(ptc1)
   puts "Profesor registrado"
rescue Exception => e
   puts e.message
end
begin
  adm.registrar(ptp1)
rescue Exception => e
   puts e.message
end
begin
  adm.registrar(ptp2)
rescue Exception => e
   puts e.message
end
#puts ptc1.calcularSueldo
#puts ptp1.calcularSueldo
adm.imprimirListado
p = adm.obtenerProfesorGanaMas
puts "-----------------------"
puts "Nombre del que gana mas: #{p.nombre} y gana #{p.calcularSueldo}"
adm.imprimirListadoTipo("TC")


