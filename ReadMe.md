Fork of https://github.com/mattingalls/Soundflower that builds with Cmake

Generate Xcode Project

`./generate-project.sh`

Build and set file permissions (requires sudo)

`sudo ./build.sh`

Install Kext (you must [disable kernel signature validation](https://apple.stackexchange.com/questions/208478/how-do-i-disable-system-integrity-protection-sip-aka-rootless-on-os-x-10-11), tread lightly)

`sudo kextload build.osx/Release/Soundflower.kext`

