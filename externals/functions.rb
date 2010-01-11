#This file and any other file in this folder should contain external functions

#Example External-function (Echo)
Robot.add_method("echo",lambda{|mes,im|
	message = mes.body
	message['echo']=''
	im.deliver(mes.from,message)
})
