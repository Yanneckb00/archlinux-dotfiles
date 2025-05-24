# drive setup
## mounting drives
- check all disks: `lsblk -f` or `sudo fdisk -l`
- check uuid of partition: `sudo blkid /dev/<drive>`
- create mount point: `sudo mkdir -p /mnt/disks/<drive>`
- edit fstab: `sudo nano /etc/fstab`
- add drive: `UUID=1234abcd-56ef-78gh-90ij-klmnopqrstuv  /mnt/disks/<drive>  ext4  defaults,noatime  0  2`
- set rights: `sudo chown -R $USER:$USER /mnt/disks/<drive>`
- test mount with `sudo mount -a`
- and check `df -h | grep <drive>`

## format drive (erase everything!)


## repair windows ntfs drives
- install `sudo pacman -S ntfs-3g`
- run `sudo ntfsfix /dev/<drive> -b && sudo ntfsfix /dev/<drive> -d`

## disks architecture
1. 500GB SSD -> arch linux drive
2. 1TB M2 SSD -> fast gaming and programs
3. 3TB HHD -> Storage
4. 500GB HDD -> Backup Storage

### mount directory
`/mnt/disks/ssd1` - label: "m2storage"
`/mnt/disks/hdd1` - label: "storage"
`/mnt/disks/hdd2` - label: "backup"

### create symlinks
- `ln -s /mnt/disks/ssd1/musik ~/MusikSSD`

or:

- `mv ~/Musik /mnt/disks/ssd1/musik`
- `ln -s /mnt/disks/ssd1/musik ~/Musik`
