#!/bin/bash
#
#Inspired by abelrd - https://www.apalrd.net/
#In the future I'd like to add more VM templates, but for now it create only Debian12 template

if ! command -v virt-customize; then
	apt update
	apt install -y libguestfs-tools
fi

SSH_KEY=~/.ssh/id_ed25519.pub
USERNAME="kamil"

DEBIAN_URL="https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
DEBIAN_IMG_NAME="debian-12-generic-amd64.qcow2"
VM_ID="1000"
VM_NAME="debian12-template"
MEMORY="1024"
CORES="2"
DISK_SIZE="10G"
STORAGE="local-zfs"
NETWORK="vmbr0"
VLAN="30"

wget $DEBIAN_URL
virt-customize --install qemu-guest-agent -a $DEBIAN_IMG_NAME

qm create $VM_ID \
	--name $VM_NAME \
	--memory $MEMORY \
	--cpu host \
	--cores $CORES \
	--net0 virtio,bridge=$NETWORK,tag=30 \
	--agent enabled=1,fstrim_cloned_disks=1 \
	--scsihw virtio-scsi-pci \
	--serial0 socket --vga serial0 \
	--scsi0 ${STORAGE}:0,import-from="$(pwd)/${DEBIAN_IMG_NAME}",discard=on\
	--ide2 ${STORAGE}:cloudinit \

qm set $VM_ID --ciuser ${USERNAME}
qm set $VM_ID --sshkeys ${SSH_KEY}
qm set $VM_ID --ipconfig0 ip=dhcp

qm disk resize $VM_ID scsi0 10G

qm template $VM_ID

rm $DEBIAN_IMG_NAME
