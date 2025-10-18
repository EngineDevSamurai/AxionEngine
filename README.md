# Axion Engine

A small Game Boy demo built using the **GBDK** and Emulicious emulator.
This project aims to implement a data oriented design based engine using an ECS.

---

## Folder Structure

Project_Folder/
  Makefile
  README.md
  **Output**/                # All compiled files, intermediate objects, and auto-generated assets
  Source/
    Include/             # Optional shared headers (for future external libraries)
    Systems/             # Game systems and gameplay logic
    Assets/
      Tiles/             # Tile graphics data
      Tilemaps/          # Tilemap layouts
    game.c               # Main game logic

---

## Building and Running

- **Build the project** (compile all source files into `Output/`):

make

- **Run the game in Emulicious**:

make run

> Hotkeys configured in VS Code:
> - `Ctrl+B` : Build 
> - `Ctrl+R` : Build & Run  
> - `Ctrl+Shift+R` : Run only  
> - Auto-saves all open files before building  

All outputs, including `.o`, `.i`, `.gb`, and any auto-generated asset files, are contained in the `Output/` folder.

---

## Dependencies

- [GBDK](https://gbdk-2020.github.io/) — Game Boy Development Kit  
- [Emulicious](https://emulicious.net/) — Java-based Game Boy emulator  
- Java Runtime Environment (for Emulicious)
- Windows users need to have make installed (via MSYS2, WSL, or Git Bash).

---

## Notes

- The project structure and naming conventions are intentionally verbose for readability and maintainability.  
- All compilation outputs are isolated in `Output/` to keep the source tree clean.  
- The project is optimized for **VS Code** with hotkeys and shortcuts, but can be built and run from the terminal on any system with the proper dependencies.  
- Asset folders (`Tiles` and `Tilemaps`) are auto-included in the build process, so no extra steps are needed to integrate them.

## Platform Specific Notes
- I develop on Linux, but with little effort this can be adopted to Windows or MacOS. Following basic getting started guides from GBDK should help you adapt to your platform.
- The makefile assumes you have GBDK installed at `/opt/gbdk.` That is the location recommended for Linux systems in the official GBDK README. If you have it installed elsewhere, you will need to adjust it accordingly.
- The makefile also assumes you want to test with Emulicious and that it is installed just outside of the project folder. If using Emulicious, you will need to adjust the command to use the correct directory. If you wish to use a different emulator, adjust the command accordingly. You know what to do, you're a developer.

