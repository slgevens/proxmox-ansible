PROXMOX
#########

Environment ::
	
	make once
	pip install proxmoxer requests

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