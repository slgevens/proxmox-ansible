PROXMOX
#########

Environment ::
	
	make once
	pip install proxmoxer requests

You have to create a file with your own variables ``vars/proxmox.yml`` ::

	---
	proxmox_vmid: 780
	proxmox_node: proxmox4
	proxmox_api_host: bridge-proxmox4.charenton.tld
	proxmox_api_user: root@pam
	template:
      jessie: 'local:vztmpl/debian-8.0-standard_8.7-1_amd64.tar.gz'
      stretch: 'local:vztmpl/debian-9.0-standard_9.0-2_amd64.tar.gz'
      
	proxmox_api_password: !vault |
	  $ANSIBLE_VAULT;1.1;AES256
	  35356539656537653762383735333162363364366366633566343366313937636162346431316464
	  6436343833323932633366623831653139346238356130330a636234363035393561363433323238
	  31393639316262336261633065363730653835323538643661343830373630633065313138653765
	  6664386266303862630a336439383838656364356531316162316434373137653539383539653430
	  6161

	proxmox_password_new_node: !vault |
	  $ANSIBLE_VAULT;1.1;AES256
	  64303833343434653539663737643930306334323135626237313166353238383537336630333363
	  3339626334396466353761306539343435386331373535350a616431333238323734656430373138
	  34383932383835306461616166626136343634343366373465653338666630666237346661633636
	  6463303836633233350a303965306262383734343238646561326136336265653539363933343236
	  6636

	proxmox_pub_key: |
	  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhUPZuemPrv7bgTEDKNFtB5/3CXxZCoA5dAcPhtdWKLl7i0PBGCFof944vcPs/Ga/oXp/wqUHXmAwPUhCSRmZiHP5WRaf+XPKqyOxr3Odhzp/HT4cXBfod/2v88Q3vHdOm10S3MYrZyJWc7TDQFGMlqbR08S20bdHiMzmcidwmLy0A4+S3NYHQBX+Uny+nM2HnV4F29Iti50bdefwCB/9NkPqoVAn+I6NWNG5r9x+9oSUHIQfv7cW/PRFBwBtvBBj+n0/U1szvuTUv6TNDeaEZZmja/cnnO45mZNwmlwGe5TDa4R8Er1VyG5T+5vIcyJfbm6R8rpGMWcGslmz6vwV4qZ4ao6g75zUafp+zK3WDlYiZENurTz0VmpVKiMNJdTEI4oIlBQh5tURoq6EDcpqFLl3CLWur49X/hsG9Fbyi6n/AuU+Pg447T0SEsoGHASo88BbW35e5Xav/WlEpH5n5FZZGZ812/Uf+bQFUs7Vfy1+/FOwTWSeO5ytoqngNuq/OsyVDMGIBbzs2am2uwbaw8xKTpLs5h6DArxGdiIz0UyVa+wCoj29+BtDJwHc6Fca0pwPUK+bpPI9nf+0TvdNf9dwlAz59yUehd2kH56T1pMj2828tYmxfQeID7ArWeegiuh0J9USNFlS173aELG/VdKPRJNxyttY3c9v4RTWQ9w== evenssolignac@live.fr
...
Usage ::

	# create one container (os_version: stretch by default)
	ansible-playbook proxmox.yml -t create -D -e hostname=evens1 -e vmid=780 -e os_version=jessie 

	#create multiple container (all with the same hostname)
	ansible-playbook proxmox.yml -t create -D -e hostname=evens1 -e vmid=[781,782,783] -e os_version=jessie

	# start
	ansible-playbook proxmox.yml -t start -e vmid=781

	# start mutiple container
	ansible-playbook proxmox.yml -t start -e vmid=[781,782,783]

	# stop
	ansible-playbook proxmox.yml -t stop -e vmid=781

	# stop multiple container
	ansible-playbook proxmox.yml -t stop -e vmid=[781,782,783]
	
	# delete
	ansible-playbook proxmox.yml -t stop -e vmid=781

	delete multiple container
	ansible-playbook proxmox.yml -t stop -e vmid=[781,782,783]