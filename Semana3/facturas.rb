class Factura
   attr_reader :numeroFactura, :razonSocialEmpresa, :rucEmpresa, :fecha, :nombreCliente, :direccionCliente,
               :rucCliente, :arregloItems
   def initialize(numeroFactura, razonSocialEmpresa, rucEmpresa, fecha, nombreCliente, direccionCliente,
                  rucCliente)
     @numeroFactura = numeroFactura
     @razonSocialEmpresa = razonSocialEmpresa
     @rucEmpresa = rucEmpresa
     @fecha = fecha
     @nombreCliente = nombreCliente
     @direccionCliente = direccionCliente
     @rucCliente = rucCliente
     @arregloItems = []
   end

   def registrar(item)
   	  arregloItems.push(item)
   end
   def calcularTotalFactura
       suma = 0
       for item in arregloItems
       	  suma+=item.calcularSubTotal #suma = suma + item.calcularSubTotal
       end
       return suma
   end
   def calcularIGV
      return (calcularTotalFactura/1.18)*0.18
   end
end

class Item
   attr_reader :id, :producto, :cantidad
   def initialize(id, producto, cantidad)
   	  @id = id
   	  @producto = producto
   	  @cantidad = cantidad   	  	
   end
   def calcularSubTotal
   	return cantidad*producto.precioUnitario
   end
end
class Producto
	attr_reader :codigo, :descripcion, :precioUnitario
	def initialize(codigo, descripcion, precioUnitario)
        @codigo=codigo
        @descripcion = descripcion
        @precioUnitario = precioUnitario #inlcuido igv
	end

end

####################### prueba
factura = Factura.new(111, "Restaurant Point", "202503948555" , "22/10/2020", "Almacenes SA", "Lima234",
                  "2030404505")
p1 = Producto.new(10003, "Fanta", 2.00)
item1 = Item.new(1, p1, 10)
p2 = Producto.new(10004, "Sublime", 2.50)
item2 = Item.new(2, p2, 2)
factura.registrar(item1)
factura.registrar(item2) 
puts "Empresa: #{factura.razonSocialEmpresa}"
puts "Numero Factura: #{factura.numeroFactura}"
puts "-----------------------------------------------"
for item in factura.arregloItems
  puts "#{item.id}  #{item.producto.descripcion}  #{item.producto.precioUnitario} #{item.calcularSubTotal}"
end
puts "-----------------------------------------------"
puts "IGV:#{factura.calcularIGV.round(2)}"
puts "Total a Pagar: #{factura.calcularTotalFactura}"


