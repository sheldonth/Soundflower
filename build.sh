#!/bin/bash
cmake --build build.osx --target SoundflowerKext --config Release
chown -R root build.osx/Release/Soundflower.kext
chgrp -R wheel build.osx/Release/Soundflower.kext
codesign --force --verbose build.osx/Release/Soundflower.kext --sign "Mac Developer"
kextutil -n -t build.osx/Release/Soundflower.kext