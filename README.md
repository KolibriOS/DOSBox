# DOSBox-0.74-3 port for KolibriOS

This repository contains a port of __DOSBox__ version __0.74-3__ for __KolibriOS__.\
__DOSBox__ is a free and open-source emulator which runs software for __MS-DOS__ compatible disk operating systems—primarily video games. 
Official site: https://www.dosbox.com/

The original `README` can be found [here](./README).

## Building

- Download the __KolibriOS__ project repository from [SVN](https://wiki.kolibrios.org/wiki/How_to_use_the_KolibriOS_Team_SVN_server);
- Set up __GCC__ cross compiler for __KolibriOS__;
- Set up the __Tup__ build system or build the necessary libraries (listed in `kolibrios_build.sh`) manually;
- Go to the root of the DOSBox repository;
- Export the KOS_SDK_DIR variable:
    ```
    export KOS_SDK_DIR=/<kolibrios-svn>/contrib/sdk
    ```
- Run the build:
    ```
    ./kolibrios_build.sh
    ```

The resulting `dosbox` binary file will be available in the root of the repository.

## Usage

Please check out the official [DOSBox Wiki](https://www.dosbox.com/wiki/) as well as the [KolibriOS Wiki](https://wiki.kolibrios.org/wiki/DosBox/)

## Known issues

In the game __Master of Orion II__ strange mouse behavior may be a bug in the SDL port.

## Authors

Author of the port: __Maxim Logaev (turbocat)__ \
The authors of the original DOSBox are listed [here](./AUTHORS)

## License

This project licensed under the terms of __GNU GPL 2.0__ license. See [this](./COPYING) for details
