class Triangulo
   attr_reader :a, :b, :c
   def initialize(a, b, c)
   	@a, @b, @c = a, b, c
   end
   def calcularSemiperimetro #verbo
      return (a + b + c)/2.0
   end
   def calcularArea #verbo accion
      p = calcularSemiperimetro
      area = Math.sqrt(p*(p-a)*(p-b)*(p-c))
      return area
   end
end

#Test

t1 = Triangulo.new(3, 4, 5)
puts "Area: #{t1.calcularArea}"
puts "Del triangulo de lados: #{t1.a}   #{t1.b}   #{t1.c}"