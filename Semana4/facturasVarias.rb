class Factura
   attr_reader :numeroFactura, :fecha, :nombreCliente, :direccionCliente,
               :rucCliente, :arregloItems
   def initialize(numeroFactura, fecha, nombreCliente, direccionCliente,
                  rucCliente)
     @numeroFactura = numeroFactura
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
class Empresa
  attr_reader :razonSocialEmpresa, :rucEmpresa, :arreglo_facturas
  def initialize(razonSocialEmpresa, rucEmpresa)
    @razonSocialEmpresa = razonSocialEmpresa
    @rucEmpresa = rucEmpresa
    @arreglo_facturas = []
  end
  def registrar(factura)
    arreglo_facturas.push(factura)
  end
  def obtenerFacturaMasCara
    maximo = 0
    facMaxima = nil
    for factura in arreglo_facturas
      if factura.calcularTotalFactura > maximo
        maximo = factura.calcularTotalFactura
        facMaxima = factura
      end
    end
    return facMaxima
  end
  def listarFacturas
    puts "-------------- LISTADO EN CONSOLA -------------------"
    for f in arreglo_facturas
       puts "#{f.nombreCliente}   #{f.calcularTotalFactura}"
    end
   end
end

####################### prueba
factura1 = Factura.new(111 , "22/10/2020", "Almacenes SA", "Lima234",
                  "2030404505")
p1 = Producto.new(10003, "Fanta", 2.00)
item1 = Item.new(1, p1, 10)
p2 = Producto.new(10004, "Sublime", 2.50)
item2 = Item.new(2, p2, 2)
factura1.registrar(item1)
factura1.registrar(item2) 

factura2 = Factura.new(112 , "22/10/2020", "Socios SA", "Lima 444",
                  "2034595965")
p3= Producto.new("10005", "Arroz", 5.00)
item3 = Item.new(1, p3, 10)
p4 = Producto.new(1006, "Barra", 1.50)
item4 = Item.new(2, p4, 2)
factura2.registrar(item3)
factura2.registrar(item4) 

empresa = Empresa.new("GLOVO SA", "88888888")
empresa.registrar(factura1)
empresa.registrar(factura2)
facturaCara = empresa.obtenerFacturaMasCara
puts "Factura Cara: #{facturaCara.nombreCliente}   Monto: #{facturaCara.calcularTotalFactura}"
puts "************* LISTADO EN HTML *****************"
for f in empresa.arreglo_facturas
   puts "#{f.nombreCliente}   #{f.calcularTotalFactura}"
end
empresa.listarFacturas




