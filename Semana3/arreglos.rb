class Auto
   attr_reader :codigo, :marca, :precio 
   def initialize(codigo, marca, precio)
   	@codigo = codigo
   	@marca = marca
   	@precio = precio
   end
   def calcularDescuento
   	   precio*0.10
   end
   def calcularTotal
   	    precio - calcularDescuento
   end
end

arreglo = []  # arreglo = Array.new

arreglo.push(10)
arreglo.push(5)
arreglo.push(20)

for p in arreglo
    puts p
end
arregloAutos = []
a1 = Auto.new(1001, "Volvo",20000)
arregloAutos.push(a1)
a7 = Auto.new(2034, "Ford", 34000)
arregloAutos.push(a7)
puts "***********************"
for auto in arregloAutos
   puts "#{auto.calcularTotal}  -  #{auto.codigo}"
end



