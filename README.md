# Настройка Visual Studio Code для Embedded разработки
Пример настройки для Windows 10.
## Подготовкa
Установим программы по списку:
- [Visual Studio Code](https://code.visualstudio.com/)
- [GNU ARM Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
- [MinGW](https://sourceforge.net/projects/mingw/files/)
- [CMake](https://cmake.org/download/)
- [J-Link](https://www.segger.com/downloads/jlink)

Для корректной работы добавим папки bin для CMake, MinGW и ARM Toolchain, а также коренную папку J-Link в переменную среды Path.
Проверим работоспособность установленных выше программ командами:
> arm-none-eabi-gcc --version

> make --version

> cmake --version

Для VSCode установим следующие расширения:
- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [Cortex-Debug](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug)
- [CMake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake)
- [CMake Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)

Настроим окружение для примера peripheral/blinky из [nRF5-SDK](https://www.nordicsemi.com/Software-and-tools/Software/nRF5-SDK).

## Настройка расширения C/C++
Для работы подсветки синтаксиса прописываем путь до компилятора и пути хидеров (в данном примере их нет и includePath пустой).
```
"C_Cpp.default.compilerPath": "C:/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update/bin",
"C_Cpp.default.includePath": []
```

## Настройка плагина CMake Tools
На этом шаге подразумевается, что читатель уже имеет созданный проект и корректный CMakeLists.txt в проекте.
В settings.json добавляем настройки:
```
 "cmake.generator": "MinGW Makefiles",
 "cmake.configureSettings": {
       "CMAKE_TOOLCHAIN_FILE": "arm-gcc-toolchain.cmake"
   },
```
Если все настроено корректно, то при нажатии F7 в окошке Output появляется примерно следующее:
```
[build] [100%] Built target blinky
[build] Build finished with exit code 0
```
Подробней с плагином можно познакомиться [тут](https://github.com/microsoft/vscode-cmake-tools) и на [канале автора](https://www.youtube.com/channel/UCkYGy96LXk3g-d6kP22aSDA).

## Настройка плагина Cortex-Debug

Создаем файл launch.json в папке .vscode.
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [            
        {
        "cwd": "${workspaceRoot}",
        "executable": "${workspaceRoot}/build/blinky.elf",// Fill in your actual path according to your own situation, here I am only the sample project I used in the current demonstration
        "name": "Debug",
        "request": "launch",
        "type": "cortex-debug",
        "svdFile": "${workspaceRoot}/nrf52.svd",
        "servertype": "jlink",//The choice of debugging emulator, which can support opennocd, pyocd, pe and stutil
        "runToMain": true,//Stop at the main function as soon as debugging
        "device": "NRF52840_XXAA",//Model of the device
        "interface": "swd",//SWD interface
        "ipAddress": null,
        "serialNumber": null, 
        },
    ]
}
```
Указываем "executable": - путь к скомпилированному .elf файлу;

"svdFile": - путь к .svd файлу с описанием регистров для нашего микроконтроллера (для nRF52 .svd файлы находятся modules/nrfx/mdk [nRF5-SDK](https://www.nordicsemi.com/Software-and-tools/Software/nRF5-SDK));

"servertype": - используемый дебаггер (я использовал J-Link GDB Server);

"device": - модель МК;

"interface": - интерфейс.

Запуск отладки происходит по нажатию клавиши F5.

[Подробнее](https://github.com/Marus/cortex-debug/wiki) о плагине.
