# Node Exporter role
Installs standalone prometheus exporter, creates a new systemd service unit called node_exporter, and starts the service.
## Example usage
* Create a directory called roles, and clone this directory into it.
* Create an inventory file with your hosts. In this example I'll call it "inventory"
* Create a playbook, I'll call it "monitored.yml":
```
---
- hosts: '{{ target_hosts }}'
  roles:
    - node-exporter
```
* Your working directory should like something like this:
```
.
├── inventory
├── monitored.yml
└── roles
    └── node-exporter
        ├── README.md
        ├── files
        │   ├── node_exporter-0.16.0.linux-amd64
        │   │   ├── LICENSE
        │   │   ├── NOTICE
        │   │   └── node_exporter
        │   └── node_exporter.service
        ├── tasks
        │   └── main.yml
        └── vars
            └── main.yml
```
* Run the playbook. In this example, we're using password based authentication (-k) and privelege escalation (-K): 
```
ansible-playbook -u sshuser -k -K -i inventory monitored.yml --extra-vars "target_hosts=all"
```

## Environment

Tested on Ubuntu 16 and 18. Should work with distributions that use systemd. Note that python3 is distributed with these system. If there is no python at /usr/bin/python you can tell ansible to use /usr/bin/python3 instead. An easy way to do this is to set a variable in your inventory file:
```
[ubuntu_eighteen]
ubuntu18server1.exampledomain.org
ubuntu18server2.exampledomain.org

[ubuntu_eighteen:vars]
ansible_python_interpreter=/usr/bin/python3
```
