# RENUansible_eduroam
This is a copy of Chris Rohrer's hard work in creating ansible scripts for installing freeradius eduroam customized to fit RENU NREN member institutions.
I do not own this content and I pay credit to the efforts done by Ubuntunet team to have the original scripts available. You can find the original repository at https://github.com/ubuntunet

Again, this repository was created to customise the original scripts to fit in with the Ugandan NREN as a separate project to help easily automate eduroam set up in Uganda.

If you have read and understood the above, either continue to README.mdown or you can visit the link below to access the original

https://github.com/ubuntunet/eduroam_radius

Either way, Good Luck

# Ansible Playbook for an eduroam IdP/Radius server

## Provisioning

- Clone the repository from Github

        :~$ git clone https://github.com/RENUUG/eduroamIdP.git ~/eduroamIdP

- Change into the newly created directory

        :~$ cd eduroamIdP

- Install ansible and all its dependencies

        :~/eduroamIdP$ chmod +x ./install-ansible.sh
        :~/eduroamIdP$ sudo ./install-ansible.sh

- Copy the inventory template

        :~/eduroamIdP$ cp inventories/template inventories/<tld_institution>

- Open your new inventory and replace

  - FQDN or IP with the actual URL/IP of your server
  - <tld_institution> with your actual inventory file name

- Copy the group_vars template

        :~/eduroamIdP$ cp group_vars/template group_vars/<tld_institution>

- Adopt the variables in group_vars/<tld_institution> to your liking

- Copy the clients template, where you'll be adding the information about the clients that are connecting to your Radius server

        :~/eduroamIdP$ cp group_vars/clients.yml.example group_vars/clients.yml

- Create the secret.yml file that contains your sensitive information. Add your credentials.

        :~/eduroamIdP$ cp group_vars/secrets.yml.example group_vars/secrets.yml

- Edit eduroam_idp.yml and add replace <tld_institution> with your actual inventory file name on line 27

        group_vars/<tld_institution>

- Run the playbook and make sure it finishes without error messages. Whenever you change something in the playbook, just replay this command.

        :~/eduroamIdP$ ansible-playbook -i inventories/<tld_institution> eduroam_idp.yml

## Adding a new client/access point (AP)

- Open group_vars/clients.yml
- Copy/Paste the client entry MyOtherAP
- Change the name, IP address and shared secret
- Re-run the playbook with the clients tag, which will only copy the clients.conf file making for a faster deployment

        :~/eduroamIdP$ ansible-playbook -i inventories/<tld_institution> --tags "clients" eduroam_idp.yml


## How do I check if it works?

### Using radtest

        radtest [user] [password] localhost:[port (default is 1812)][nas-port-number(default 0)][shared_secret]

and check for an "Access-Accept" in the response.

- Run radtest remotely if you have enabled the static test user

        ansible radius -i inventories/<tld_institution> -a "radtest test mySecret localhost:1812 0 testing123"

- Run the Freeradius service manually to see what is happening at the server side

  - Log into your machine
  - Stop the freeradius daemon

            $ sudo service freeradius stop
  - Start it manually in debug mode

            $ sudo freeradius -X

### Using eapol_test

See also http://deployingradius.com/scripts/eapol_test

- Enable eapol_test role in your group_vars file

          play_eapol: True

- Re-run playbook

          :~/eduroamIdP$ ansible-playbook -i inventories/<tld_institution> eduroam_idp.yml          

- Log into the server
- Have a look at the configuration test file in your home folder

          vi peap-mschapv2.conf

- Run the test

          eapol_test -c ~/peap-mschapv2.conf -s testing123
