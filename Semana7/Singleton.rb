require 'singleton'
 
class AppConfig
  include Singleton
  def iniciar(nombre)
  	@nombre = nombre
  end
  def mostrar
  	 "Hello " + @nombre
  end
  def cambiar(nombre)
  	@nombre = nombre
  end
end

app1 = AppConfig.instance
app1.iniciar("Pepe")
puts app1.mostrar #Hola Pepe
app2 = AppConfig.instance
app1.cambiar("Ana")
puts app2.mostrar#Hola Ana
puts app1.mostrar#Hola Ana
if app1==app2

	puts "Si son iguales"
else
	puts "Son diferentes"
end

