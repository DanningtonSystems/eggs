# Images and Pterodactyl Eggs

OCI images and Pterodactyl eggs, created for both DanningtonSystems and the general public. Most images are Alpine Linux-based, however some images may be based on other systems like Enterprise Linux or Debian, and will be labeled as such if applicable.

## Licencing
Unless if **EXPLICITLY** stated otherwise, all Pterodactyl eggs and OCI images in this repository are licensed under the [GNU General Public License v3.0](LICENSE.md). TL;DR: This is free software, and you are welcome to use it. However, distribution of forks are only allowed if the redistribution is also licenced under GPLv3 or later. Redistributions **must** also be open sourced.

## Building OCI images from this repository

Of course, you can manually run the image build commands yourself. However, `canteen` is a custom-built shell script (inspired by Google's `lunch` CLI for building AOSP) that automates the process of building OCI images. 

**NOTE: You will need Bash installed on your system in order to use `canteen` as it complies with Bash syntax.**

`canteen` will automatically pull the `canteen.sh` script from the folder requested *if it exists*. This system is much more flexible, and allows for developers to add their own workflows to the `canteen` build process. All built-in packages will be automatically tagged under their public tags.