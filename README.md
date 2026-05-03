this is Lua script to extract files made using Motorola singleimage tar utility(star).

Currently, only star tool that we can find from some of blankflash files(eg. [this](https://mirrors.lolinet.com/firmware/motorola/river/blankflash/blankflash_from_QPUS30.52-23-4.zip)) and [imjtool](http://newandroidbook.com/tools/imjtool.html) can unpack these Motorola singleimage tar utility made files having SINGLE_N_LONELY magic as far as I know. But I guess these are not Open Source.

Ref:
- https://forum.xda-developers.com/t/radio-img-extractor.4055203/post-87267413
- https://forum.xda-developers.com/t/edl-mode-and-test-point-of-the-moto-g-5g-plus.4371213/post-87807175

### Projects using this

- [LineageOS](https://github.com/LineageOS/android_tools_extract-utils/blob/97c5f8f93aae560092bd5c7d103b3a4e35596e36/extract_utils/extract_star.py)
- [CalyxOS](https://github.com/CalyxOS/scripts/blob/65615eb60cdcd51a7725a1c6d06266ad578f089a/motorola/star.sh)
- [Firmware_extractor](https://github.com/AndroidDumps/Firmware_extractor/blob/3df95e8be60d5a0160bced0b690fb61b3d74342a/tools/star)


## License

[CC0-1.0](./LICENSE).

