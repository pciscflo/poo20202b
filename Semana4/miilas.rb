class Socio
  attr_reader :dni, :nombre
  def initialize(dni, nombre)
    @dni =dni
    @nombre = nombre
  end
end
class Tarjeta
  attr_reader :socio, :cantidadMillas
  def initialize(socio, cantidadMillas)
  	@socio = socio
  	@cantidadMillas = cantidadMillas
  end
  def calcularCategoria
  	categoria = nil
  	if cantidadMillas<15000
      categoria = "Base"
    elsif cantidadMillas<250000 and cantidadMillas>=15000
    	categoria = "Premium"
    elsif cantidadMillas>=250000
        categoria = "Elite"    	
    end
    return categoria
  end
  def comprarMillas(monto) #al comprar se actualiza la cantidadMillas
  	 if calcularCategoria=="Base"
  	 	@cantidadMillas = @cantidadMillas + 30*monto
  	 elsif calcularCategoria=="Premium"
  	 	@cantidadMillas = @cantidadMillas + 50*monto
  	 elsif calcularCategoria=="Elite"
  	 	@cantidadMillas = @cantidadMillas + 90*monto
  	 end
  end
end

class Aerolinea
   attr_reader :arregloTarjetas
   def initialize
    	@arregloTarjetas = []
   end
   def registrar(tarjeta)
   	arregloTarjetas.push(tarjeta)
   end
   def calcularMillasAcumuladasTodos
   	   suma=0
   	  for tarjeta in arregloTarjetas
         suma+=tarjeta.cantidadMillas
   	  end
   	  return suma
   end
   def comprarMillasPremium(monto)
   	  for tarjeta in arregloTarjetas
   	  	if tarjeta.calcularCategoria == "Premium"
   	  	    tarjeta.comprarMillas(monto)
   	  	end
   	  end
   end
   def comprarMillas(monto, dni)

   end
end
aerolinea = Aerolinea.new
socio = Socio.new("88888888","Pepe")
tarjeta = Tarjeta.new(socio, 10000)
socio2 = Socio.new("9999999","Carlos")
tarjeta2 = Tarjeta.new(socio2, 50000)
aerolinea.registrar(tarjeta)
aerolinea.registrar(tarjeta2)
puts aerolinea.calcularMillasAcumuladasTodos
aerolinea.comprarMillasPremium(2000)
puts aerolinea.calcularMillasAcumuladasTodos



