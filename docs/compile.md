Compile librerpi
================

Here are instructions on how to compile librerpi

### Download the source code

Librerpi uses Git for the source code, you can get a copy of it by
doing:

    $ git clone --recurse-submodules http://GitHub.com/librerpi/lk-overlay.git
            

### Compile librerpi

You need Nix for that:

    $ sh <(curl -L https://nixos.org/nix/install) --daemon
            

#### RaspberryPi 0-3

Librerpi supports the Pi0-Pi3 line, but it's possible to load Linux only
on the Pi2 at the moment so using the Pi2 is recommended.

##### Build stage1 (required for initialising dram and loading stage2)

    $ nix build -f release.nix vc4.vc4.stage1 -o stage1-link
            

##### Build stage2 (only works on Pi2, required for initialising everything else and boot linux)

    $ nix build -f release.nix vc4.vc4.stage2 -o stage2-link
            

After that, copy the binairies to the SD Card,

- For stage1, copy the `lk.bin` to the FAT32 boot partition of the SD
Card, and rename it to `bootcode.bin` ;

- For stage2, copy the `lk.elf` to /boot on the main partition.

#### RaspberryPi 4

**WARNING:** While it is possible to compile librerpi for the
RaspberryPi 4, we don't recommend doing so!

You have 2 choices:

- You have a non-free stage1 but free stage2


	$ nix build -f release.nix rpi4.rpi4.recovery -o stage1-link # stage1


- You have a free stage1 but no stage2 (which means linux won't load)


	$ nix build -f release.nix rpi4.rpi4.start4 -p stage2-link # stage2


After that,

- For non-free stage1 but free stage2, copy the stage2 to `/boot/start4.elf` ;

- For free stage1 but no stage2, copy the stage1 to the FAT32 partition as 
`recovery.bin`.


