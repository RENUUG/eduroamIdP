#    #This vagrant file has been edited to fit in only relevant code.
#    #For a more explained vagrant file. Kindly check on the 'vagrantbackup' in this same directory
#    #The comments here provide you with a more understanding of why its here. Specifically for this project
#    #Kindly read more about Vagrant from other sources if you want to understand it more
Vagrant.configure("2") do |config|
#    #This box specifies which OS will be installed.
#    #If this box is not yet existent on your machine. It will first download it.
#    #Therefore, your first 'vagrant up' command will take a longer while
config.vm.box = "ubuntu/bionic64"

#    #Used piblic network because the best option in this case would be a bridged network on your VirtualBox
#    #Check 'vagrantbackup' for other options
#    #If for some reason you want to create/recreate the instance with the same IP, uncomment and edit the IP section
#    #This has to be an IP in the range of your host's connected IPs
config.vm.network "public_network"    #, ip: "196.43.159.139"

#    #Hostname assigned to the vm after creation.
#    #Not so relevant to eduroam tests but gives a closer feel of the actual deployment
#    #Edit it to a full hostname you would prefer for your test server
config.vm.hostname = "radius.test.renu.ac.ug"

    #VirtualBox Additional configs
config.vm.provider "virtualbox" do |vb|
#   # Display the VirtualBox GUI when booting the machine
   vb.gui = false
#   # The name should on VirtualBox, edit to something preferable for you
   vb.name = "eduroam"
#   # Customize the amount of memory on the VM:
#   # Freeradius is not so heavy on RAM so even 512 or even 256 can do. Depends on your host capacity
   vb.memory = "1024"
end

#   # Never say the relevance to add in any scripts. Thats all folks
end
