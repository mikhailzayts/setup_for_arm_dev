# Настройка Visual Studio Code для Embedded разработки
Я провел много часов в поисках адекватной, удобной и приятной для глаз среды разработки под микроконтроллеры ARM.
Однако, не найдя ничего действительно приятного, я решил собрать оную на основе любимого редактора кода Visual Studio Code.
Сразу хочется признаться в незавершенности данного гайда. Есть трудности в настройке, которые в дальнейших итерацих гайда хотелось бы устранить,
есть вещи, которые работают не так, как хотелось бы. Об этом обо всем напишу далее. Однако, несмотря на это, пользоваться VSCode в качестве
среды разработчки оказалось очень приятно.

Все действия дальше проводились под Windows 10.

## Подготовкa
Для начала необходимо установить все необжодимые компоненты. В качестве компилятора используем GNU ARM Embedded Toolchain, отлаживать будем SEGGER'овским
JLink GDB, собирать проект - CMake и make. Ну и в качестве редактора - Visual Studio Code и наборчик плагинов для того, чтобы связать это все вместе.

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

Данный плагин написан разработчиком под ником (добавить ник), записавшим серию видео-туториалов по использованию CMake. Плагин оказался настолько удачен и удобен, что сейчас его поддержкой занимается Microsoft. Его настройка происходит достаточно просто: жмем CTRL+SHIFT+P, пишем ...

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
Плагин, выступая оберткой над списком различных отладчиков, позволяет использовать VSCode в качестве средства отладки микроконтроллеров ARM.
Для настройки создаем файл launch.json и заполняем его следующим образом:

.svd файл - файл с описанием доступных регистров перриферии конкретного микроконтроллера. Найти его можно на сайте производителя (для STM'ок) или 
в составе поставляемого вендором SDK (как для nRF52).

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
