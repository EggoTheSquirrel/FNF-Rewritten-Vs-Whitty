# Friday Night Funkin' Vs. Whitty for Nintendo Switch
This is a mod of the FNF Rewritten by HTV04 which can be found here https://github.com/HTV04/funkin-rewritten.
It adds a week for Whitty, one of the first characters to be modded into the original FNF.
More is planned!

If you are looking for information about FNFR itself or looking to follow the steps below, you should probably look into the link above.
Original readme follows:

# Friday Night Funkin' Rewritten for Nintendo Switch
This branch contains the code for the Switch port of FNF Rewritten. For more details about the project, check out the `main` branch.

# License
*Friday Night Funkin' Rewritten* is licensed under the terms of the GNU General Public License v3, with the exception of most of the images, music, and sounds, which are proprietary. While FNF Rewritten's code is FOSS, use its assets at your own risk.

Also, derivative works (mods, forks, etc.) of FNF Rewritten must be open-source. The build methods shown in this README technically make one's code open-source anyway, but uploading it to GitHub or a similar platform is advised.

# Building
Building the Switch port of FNF Rewritten as a LOVE file is recommended since it's easier to setup and work with.

## Unix-like (macOS, Linux, etc.)
### LOVE file (Nintendo Switch)
* Run `make`

Results are in `./build/lovefile-switch`.

### Nintendo Switch
* Set up [devkitPro](https://devkitpro.org/wiki/Getting_Started)
  * Install the `switch-dev` package
* Set up dependencies shown in `./resources/switch/dependencies.txt`
* Run `make switch`

Results are in `./build/switch`.

### Release ZIPs
* Set up [devkitPro](https://devkitpro.org/wiki/Getting_Started)
  * Install the `switch-dev` package
* Set up dependencies shown in `./resources/switch/dependencies.txt`
* Run `make release`

Results are in `./build/release`.

## Other
Follow the official instructions for LÖVE Potion game distribution for your platform: https://lovebrew.org/#/packaging
