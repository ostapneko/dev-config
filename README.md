dev-config
==========

Ansible-based development config to use with Ubuntu 12.04.
You need to somehow assign the variable $dev_user.
Example: `ansible-playbook -i /path/to/inventory/file dev-config/playbooks/all.yml --extra-vars "dev_user=my_user"`
