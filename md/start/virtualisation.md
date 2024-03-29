# Virtualisation

In a nutshell, here's how to virtualize Kaisen Linux.  
We assume here that you know what a hypervisor is, as well as creating a virtual machine.  
We recommends to use VirtualBox, VMWare Workstation or QEMU/KVM hypervisors.  
The VMWare, Virtualbox and QEMU/KVM guests daemons are activated by default when Kaisen Linux is executed in them.  

## VirtualBox
You can virtualize Kaisen Linux with VirtualBox hypervisor.  
Following this step:

### Minimal Configuration
```bash
1)  New virtual machine
2)  Name: Your choice
3)  Folder: Your choice
4)  Type: Linux
5)  System: Debian 10 (64 bits)
6)  RAM: 1Go
7)  Create Virtual Disk
8)  Disk type : VDI (or VMDK)
9)  Dynamic allocated
10) Hard Drive: 10Go
11) Click at : Configuration => Network => Adapter1
12) Network configuration: NAT, Bridge, Host-only, NAT network, or not (the installer not using network and all tools are included) (optional parameter)
13) System => Processor => CPU: 1 core
14) You can use EFI (optional parameter)
15) Leave the other default settings (except if you have specific needs)
```

### Recommend configuration
```bash
1)  New virtual machine
2)  Name: Your choice
3)  Folder: Your choice
4)  Type: Linux
5)  System: Debian 10 (64 bits)
6)  RAM: 4Go
7)  Create Virtual Disk
8)  Disk type : VDI (or VMDK)
9)  Dynamic allocated
10) Hard Drive: 30Go
11) Click at : Configuration => Network => Adapter1
12) Network configuration: NAT, Bridge, Host-only, NAT network, or not (the installer not using network and all tools are included) (optional parameter)
13) System => Processor => CPU: 2 core
14) You can use EFI (optional parameter)
15) Leave the other default settings (except if you have specific needs)
```

### Install guest additions from a host system other than Kaisen Linux
To install the VirtualBox Guest Additions from a host system other than Kaisen Linux, you must use the Guest Additions ISO provided by Oracle which can be downloaded here: https://download.virtualbox.org/virtualbox/6.1.34/VBoxGuestAdditions_6.1.34.iso (Version 6.1.34 is the latest version as of this writing).
Once the CD is inserted into the VM, run these commands:
```bash
sudo mkdir /tmp/vboxguests
sudo cp -rf /media/cdrom0/* /tmp/vboxguests
sudo /tmp/vboxguests/autorun.sh
```
Let the process complete and follow the given steps.
Once all this is done, you must restart the VM and you will be able to enjoy the full guest additions installed on the VM!

### Install guest additions from a Kaisen Linux system host
To install the VirtualBox Guest Additions from a Kaisen Linux system host, you can find the ISO of guest additions here: **/usr/share/virtualbox/VBoxGuestAdditions.iso**
Once the CD is inserted into the VM, run these commands:
```bash
sudo mkdir /tmp/vboxguests
sudo cp -rf /media/cdrom0/* /tmp/vboxguests
sudo /tmp/vboxguests/autorun.sh
```
Let the process complete and follow the given steps.
Once all this is done, you must restart the VM and you will be able to enjoy the full guest additions installed on the VM!

## VMWare Workstation
You can virtualize Kaisen Linux with VMWare Workstation hypervisor.
Following this step:

### Minimal configuration
```bash
1)  New Vitual Machine
2)  Typical
3)  Use ISO image (select your ISO with browse button)
4)  Guest Operating System: Debian 10 64 bits
5)  Name: Your choice
6)  Location: Your choice
7)  Disk Size: 10Go
8)  Select: "Store virtual disk as a single file"
9)  Select: "Customize hardware"
10) RAM: 1Go
11) CPU: 1 core and 1 CPU
12) Network: NAT, Bridge, LAN segment, Host-Only or not (the installer not using network and all tools are included) (optional parameter)
13) Leave the other default settings (except if you have specific needs)
14) Click in: Finish
15) For activate UEFI: Shutdown VM and click at => "Edit virtual machine settings" => Options => Advanced => UEFI
```

### Recommend configuration
```bash
1)  New Vitual Machine
2)  Typical
3)  Use ISO image (select your ISO with browse button)
4)  Guest Operating System: Debian 10 64 bits
5)  Name: Your choice
6)  Location: Your choice
7)  Disk Size: 30Go
8)  Select: "Store virtual disk as a single file"
9)  Select: "Customize hardware"
10) RAM: 4Go
11) CPU: 2 core and 1 CPU
12) Network: NAT, Bridge, LAN segment, Host-Only or not (the installer not using network and all tools are included) (optional parameter)
13) Leave the other default settings (except if you have specific needs)
14) Click in: Finish
15) For activate UEFI: Shutdown VM and click at => "Edit virtual machine settings" => Options => Advanced => UEFI
```

## Informations for QEMU/KVM

### Tools and daemons
To facilitate the creation of a virtualized virtual machine with QEMU/KVM, all virtual machines can be created through virt-manager. Full support for different agents like QEMU agent, SPICE, are integrated by default but disabled.  
SPICE agents allow you to activate the shared clipboard, put the virtual machine in full screen when viewing it via the console. This is the equivalent of the virtualbox and vmware agents.  
SPICE agents are managed by a systemd service.  
The integrated services are named **spice-vdagent** as well as **spice-webdavd**.
The **spice-vdagent** daemon allows you to enable copy and paste as well as to adjust the resolution of the virtual machine screen in relation to the resolution of the host. This daemon is useful for guest guests (using a graphical interface).  
The **spice-webdavd** daemon is used to support file sharing between the host and the virtual machine.  
