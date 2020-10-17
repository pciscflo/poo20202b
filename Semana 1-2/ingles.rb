class Alumno
   def initialize(codigo, nombre, t1, t2)
   	@codigo = codigo
   	@nombre = nombre
   	@t1 = t1
   	@t2 = t2
   end
   def obtenerNivel
   	 if @t1>=85 and @t2>=85
   	 	return "Aprobado" 
   	 elsif (@t1>=85 and @t2<85) or (@t2>=85 and @t1<85)
   	    return "Observado"
   	 else
   		return "Reprobado"   	 		
   	 end
   end
end
## Testing
#Formulario ingresar los datos por teclado
print("Ingrese codigo:")
codigo = gets.chomp.to_s
print("Ingrese nombre:")
nombre = gets.chomp.to_s
print("Ingese nota t1:")
t1  = gets.chomp.to_i
print("Ingese nota t2:")
t2  = gets.chomp.to_i
a1 = Alumno.new(codigo, nombre, t1, t2)
puts a1.obtenerNivel

a2 = Alumno.new("u88888", "Carla", 77, 77)
puts a2.obtenerNivel 
