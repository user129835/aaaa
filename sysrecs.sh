
hostname -i
ssh login@10.11.12.xxx
sudo su

apt-get update
apt install mc

cfdisk /dev/sdb gpt new 2g write yes
cfdisk /dev/sdc gpt new 2g write yes
# lsblk (sdb & sdb1 && sdc & sdc1)

apt-get update
apt install mdadm samba
#(Raid 5 = 5, raid 1= 1)
mdadm --create /dev/mdx --level=5 --raid-devices=3 /dev/sd[abc]1
mdadm --detail /dev/mdx

mdadm --detail  --scan /dev/mdx >> /etc/mdadm/mdadm.conf
vim /etc/mdadm/mdadm.conf
update-initramfs -u

mkfs.ext4 /dev/mdx
mkdir /serveris
mkdir /serveris/backup
mount /dev/mdx /serveris
vim /etc/fstab
# /dev/mdx       tab.    /Serveris.      Tab.    ext4.   Tab.    Defaults.    Tab.  0.   Tab    0

mount -a
Systemctl status smbd.service
Systemctl start smbd.service
vim /etc/samba/smb.conf

# [gudelis]
#     path=/serveris/backup
#     Browseable=yes
#     Gues ok = no
# Force user = root
# Write list = gudelis

smbpasswd -a gudelis
# Parole1
Systemctl restart smbd

'''
[1:10 PM]
NOTE:
mdx:
Tas x ir cipars, eksāmenā var būt jebkāds
[1:12 PM]
(skaties kā tev ir, ja tu boot loadoji sda, tad ņem bcd, ja d tad abc)
Tas mdadm --create /dev/mdx --level=5 --raid-devices=3 /dev/sd[abc]1
[1:14 PM]
lsblk
'''






cfdisk /dev/sdb gpt new 2g write yes
cfdisk /dev/sdc gpt new 2g write yes

# lsblk (sdb & sdb1 && sdc & sdc1)
apt-get update
apt install mdadm samba
# (Raid 5 = 5, raid 1= 1)
mdadm --create /dev/mdx --level=5 --raid-devices=3 /dev/sd[abc]1

mdadm --detail /dev/mdx
mdadm --detail  --scan /dev/mdx >> /etc/mdadm/mdadm.conf
vim /etc/mdadm/mdadm.conf
update-initramfs -u

mkfs.ext4 /dev/mdx
mkdir /serveris
mkdir /serveris/backup
mount /dev/mdx /serveris
vim /etc/fstab
# /dev/mdx       tab.    /Serveris.      Tab.    ext4.   Tab.    Defaults.    Tab.  0.   Tab    0

'''
[2:13 PM]
sis viss ir raid
[2:13 PM]
level 5 ir raid 5
[2:13 PM]
level 1 ir raid 1
[2:13 PM]
--raid-devices ir 2 ja ir raid 1 utt
'''
