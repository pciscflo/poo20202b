class Triangulo
   def initialize(a, b, c)
   	@a, @b, @c = a, b, c
   end
   def calcularSemiperimetro #verbo
      return (@a + @b + @c)/2.0
   end
   def calcularArea #verbo accion
      p = calcularSemiperimetro
      area = Math.sqrt(p*(p-@a)*(p-@b)*(p-@c))
      return area
   end
   def getA
   	 return @a
   end
   def getB
   	 return @b
   end
   def getC
   	 return @c
   end
end

#Test

t1 = Triangulo.new(3, 4, 5)
puts "Area: #{t1.calcularArea}"
puts "Triangulo de lados: #{t1.getA}  #{t1.getB}  #{t1.getC}"