class Figura
	def calcular_area
	end
end
class Triangulo < Figura
  attr_accessor :a,:b
  def initialize(a, b)
  	@a,@b = a,b
  end
  def calcular_area
  	b*a/2.0
  end
end
class Rectangulo < Figura
    attr_accessor :a, :b
    def initialize(a, b)
    	@a,@b=a,b
    end
	def calcular_area
		a*b
    end
end
class Circulo < Figura
    attr_accessor :radio
    def initialize(radio)
      @radio=radio
    end
  def calcular_area
     3.1415*radio*radio
    end
end
class Factoria
  def self.create(tipo, *arg)
     case tipo
     when "t"
     	Triangulo.new(arg[0],arg[1])
     when "r"
     	Rectangulo.new(arg[0],arg[1])   
      when "c"
      Circulo.new(arg[0])     	
     end
  end
end

###
t = Triangulo.new(2,4)
puts "Clasica:#{t.calcular_area}"
## Con FActoria
f = Factoria.create("t",2,4)
puts "Con factory:#{f.calcular_area}"
c = Factoria.create("c",5)
puts "Circulo area: #{c.calcular_area}"