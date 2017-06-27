Fork of https://github.com/mattingalls/Soundflower that builds with Cmake

Generate Xcode Project
./generate-project.sh

Build and set file permissions (requires sudo)
sudo ./build.sh

Install Kext (you must disable kernel signature validation, tread lightly)
sudo kextload build.osx/Release/Soundflower.kext

