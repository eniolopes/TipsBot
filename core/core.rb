#Core class , Robot base.
class Robot
	attr_accessor :im,:lista_amigos,:lista_proc,:lista_mens
	def initialize(usuario,senha)
		@im = Jabber::Simple.new(usuario,senha)
		@im.accept_subscriptions=true
		@lista_amigos = Array.new 
		@lista_proc = Hash.new
		@lista_mens = Hash.new
		puts "Main Class Loaded."
	end
	#Functions that are going to be used later by the user
	def self.add_method(name,function)
		@@methods ||= Hash.new
		@@methods.store(name,function)
		puts "Method #{name} added."
	end
	#Verify if there's any new message sent by the user.
	def verificarMensagens
		puts "Verificando mensagens enviadas."
		if @im.received_messages?
			@im.received_messages.each do |mes|
				#TO-DO: Verify if the command is valid in order to avoid dangerous acts from the user.
				mes.body.sub(/[^ ]*/){|metodo| 
					method = @@methods[metodo]
					if method
						method.call(mes,@im)
					else
						@im.deliver(mes.from,"Function does not exist.")
					end
				}
			end
		end
	end
end
