def factorial(n)
	raise "Argumento incorrrecto" if n<1
	return 1 if n==1
	n*factorial(n-1)
end

begin
  puts factorial(3)
rescue Exception => e
   #grabar en el log
   puts "Disculpe " + e.message  #para el usuario
end
puts "Continua el programa..."
