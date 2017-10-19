PROXMOX
#########

Environment ::
	
	make once
	pip install proxmoxer requests

Usage ::

	# create
	ansible-playbook proxmox.yml -t create -D -e hostname=evens1 -e vmid=780

	# start
	ansible-playbook proxmox.yml -t start -D -e vmid=780

	# stop
	ansible-playbook proxmox.yml -t stop -D -e vmid=780

	# delete
	