PROXMOX
#########

Environment ::
	
	make once
	pip install proxmoxer requests

Usage ::

	# create one container
	ansible-playbook jessie-proxmox.yml -t create -D -e hostname=evens1 -e vmid=780

	#create multiple container (all with the same hostname)
	ansible-playbook jessie-proxmox.yml -t create -D -e hostname=evens1 -e vmid=[781,782,783]

	# start
	ansible-playbook jessie-proxmox.yml -t start -e vmid=781

	# start mutiple container
	ansible-playbook jessie-proxmox.yml -t start -e vmid=[781,782,783]

	# stop
	ansible-playbook jessie-proxmox.yml -t stop -e vmid=781

	# delete
	ansible-playbook jessie-proxmox.yml -t stop -e vmid=[781,782,783]