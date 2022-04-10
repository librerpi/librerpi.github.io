Compile librerpi
================

Here are instructions on how to compile librerpi

### Download the source code

Librerpi uses Git for the source code, you can get a copy of it by
doing:

	$ git clone --recurse-submodules http://github.com/librerpi/lk-overlay.git
            

## Compile librerpi

You need Nix for that:

	$ sh <(curl -L https://nixos.org/nix/install) --daemon


### 

#### RaspberryPi 0-3

Librerpi supports the Pi0-Pi3 line, but it's possible to load Linux only
on the Pi2 at the moment so using the Pi2 is recommended.

##### Build stage1 (required for initialising dram and loading stage2)

	$ nix build -f release.nix vc4.vc4.stage1 -o stage1-link
            

##### Build stage2 (loads linux only on the Pi2, required for initialising everything else)

	$ nix build -f release.nix vc4.vc4.stage2 -o stage2-link
            

After that, copy the binairies to the SD Card,

- For stage1, copy the `lk.bin` to the FAT32 boot partition of the SD
Card, and rename it to `bootcode.bin` ;

- For stage2, copy the `lk.elf` to /boot on the main partition
(or `start4.elf` on the FAT32 partition if using a non-free stage1).

#### RaspberryPi 4

**WARNING:** While it is possible to "run" librerpi on the
RaspberryPi 4, we don't recommend doing so! Currently, the Pi4 port lacks 
a ton of functionnality for it to be usable (it can't even initialise the 
arm CPU) and as such, it's not recommended to use the Pi4 with librerpi in 
production. You have been warned!

##### Build stage1 (required for initialising dram and loading stage2)

	$ nix build -f release.nix rpi4.rpi4.recovery -o stage1-link # stage1

##### Build stage2 (doesn't load linux yet, currently cannot bring up the 
arm CPU)

	$ nix build -f release.nix rpi4.rpi4.start4 -p stage2-link # stage2

After that, copy the binairies to the SD Card,

- For stage1, copy the `lk.bin` to the FAT32 boot partition of the SD
Card, and rename it to `recovery.bin`

- For stage2, copy the `lk.elf` to /boot on the main partition 
(or `start4.elf` on the FAT32 partition if using a non-free stage1).

