# Versão 2.1 alpha , TipsTalk

# Software basicamente cria um usuario no gtalk que permite ao usuario postar no twitter, pode ser facilmente expandido para outras funções

# This Software Basically connects to as a google talk user and allow through messages to users post messsages on twitter , can be easily expanded into new functions.

#O script deverá varrer a classe Tipstalk e capturar todas as pessoas, verificar quais já estão adicionadas , mandar convite as que não estão e então iniciar Thread que ficará enviando ao usuario os seus ultimos tweets e twittando para a pessoa, thread deverá ficar identificado em uma hash para o script verificar se a pessoa não já possui uma conexão aberta e se não tiver iniciar uma em loop que verifica a classe tweet talk.

#Tudo acima foi feito na versão 1.0 ,otimizado e transformado para classes na 1.1, bugs corrigidos na 1.2 e convertido pra oAuth na 2.0 e código "limpo"(Ainda falta limpar algumas coisas....) na 2.1 .

#This code is licensed under the terms of GPLv3.
#Este código esta licenciado sob os termos da GPLv3.

require 'rubygems' #Para acessar as gems abaixo
require 'active_record' # Acesso ao banco de dados.
require 'xmpp4r-simple' # Gem para acesso ao Jabber simplificada.

def require_all_on(dir)
	$LOAD_PATH.unshift(dir)
	Dir[File.join(dir, "*.rb")].each {|file| require File.basename(file) }
end

puts "Requiring libs done. Now will load bot's core."
require_all_on('core')

puts "Starting Bot."
@robot = Robot.new("user@gmail.com","password") #The user and password that is going to be used by your software in gtalk.
puts "Connected."

puts "Loading External Functions."
require_all_on('externals')

puts "Entering in Activity."
while true
	sleep(5)
	@robot.verificarMensagens
end

