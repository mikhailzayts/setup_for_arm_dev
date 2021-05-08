# Настройка Visual Studio Code для Embedded разработки
## Подготовка (для Windows 10)
Установим программы по списку:
- [Visual Studio Code](https://code.visualstudio.com/)
- [GNU ARM Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
- [MinGW](https://sourceforge.net/projects/mingw/files/)
- [CMake](https://cmake.org/download/)
- [J-Link](https://www.segger.com/downloads/jlink)

Для корректной работы добавим папки bin для CMake, MinGW и ARM Toolchain в переменную среды Path.
Проверим работоспособность установленных выше программ командами:
'''
arm-none-eabi-gcc --version
make --version
cmake --version
'''
Для VSCode установим следующие расширения:
- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [Cortex-Debug](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug)
- [CMake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)
- [CMake Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)


