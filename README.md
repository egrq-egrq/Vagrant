# Home Lab with Vagrant

## Description

- Vagrant configurations and helper scripts for a local home lab.
- Designed for Apple Silicon (ARM64) systems.

---

### Available Configurations

| Name | Virtualization | Status | Usage | Description |
|:-----|:--------------:|:------:|:------|:------------|
| [Vagrantfile](Vagrantfile) | VirtualBox | Stable | `vagrant up` | **Recommended.** Default daily-use configuration. |
| [reset-vagrant-project.sh](reset-vagrant-project.sh) | Shell | Stable | `./reset-vagrant-project.sh` | Destroys this project's VMs and removes its local Vagrant state. |

---

### Archive

| Name | Virtualization | Status | Usage | Description |
|:-----|:--------------:|:------:|:------|:------------|
| [archive/qemu/Vagrantfile](archive/qemu/Vagrantfile) | QEMU | Archived | `cd archive/qemu && vagrant up --provider=qemu` | Legacy ARM64 configuration. |
| [archive/vmware-ansible/](archive/vmware-ansible/) | VMware / Ansible | Archived | `cd archive/vmware-ansible && vagrant up --provider=vmware_desktop` | Legacy multi-VM configuration and helper files. |

> Archived configurations are retained for reference and are not maintained.
>
> `reset-vagrant-project.sh` and the archived `cleanup.sh` destroy virtual machines. Review them before use.
