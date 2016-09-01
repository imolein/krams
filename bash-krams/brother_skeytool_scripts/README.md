# brother_skeytool_scripts
These are scripts for the scankey-tool (brscan-skey) from Brother. The scripts provided by the package lacks an functionality, such as:
* files are not converted (to jpg or pdf)
* scanning of multiple pages are not supported
* if you want scan to mail, you have to hardcode the receiver

## Dependencies
* [Scankey Tool](http://support.brother.com/g/s/id/linux/en/instruction_scn3.html?c=us_ot&lang=en&comple=on&redirect=on)
* sane-utils
* imagemagick
* xdg-utils

## Installation
* Install and configure the scanner driver first
* Install the Scankey Tool
* Download the scripts or clone this git
* move the script's to */opt/brother/scanner/brscan-skey/script* and make them executable
* edit the configuration */opt/brother/scanner/brscan-skey/brscan-skey-0.2.4-0.cfg* and change file names

## Function
* scantoimage.sh scans the page, convert it to jpg and open the path with the file browser
* scantofile.sh scan the page, convert it to pdf and open the path with the file browser
* scantomail.sh scan the page, convert it to pdf and open the mail program, where the file is already attached
* scantox.sh are the functions, if you want to edit something, do it there

I also wrote a [blog article](http://blog.kokolor.es/brothers-brscan-skey-nutzbar-machen/) about it, mainly about the bugs in this package. (in german)
If someone have a bug or any suggestions, write me.
