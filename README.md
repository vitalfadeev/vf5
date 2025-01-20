#

boot - kernel - services - apps - desktop - windows
        |
       devices
        |
       modules

# UI

## e - element
e
 e
  e box green rounded

box
 boder 1px solid #ccc

green
 bg green

rounded
 border-radius 10px

## menu
e menu-bar
 e menu-item samesize
 e menu-item samesize

menu-bar
 top 0

samesize
 width 200px

## e
struct e {
    pos 
      x         0..16385
      y         0..16385
    size 
      w         0..16385 
      h         0..16385
    text
      chars     "abc"
      font
        family  "abc"
        size    0..256
        bold    0/1
        italic  0/1
      align     left / center / right
    image
      src       "abc"
    magnet
      left      -1/0/1
      right     -1/0/1
}


## events
e
 e input-text

input-text
 on key ctrl+a select all

global
 on key ctrl+a select all


# Deps

sdl2, sdl2_image, 
[freeimage]


## Size priority

### size = auto
e.size = auto                // 120 32
e.content.image.size = 120 32

### image = auto
e.size = 120 32
e.content.image.size = auto  // 120 32

### size = auto, has borders 
e.size = auto                // 120+10 32+10
e.content.image.size = 120 32
e.borders.w = 10

### image = auto, has borders
e.size = 120 32
e.content.image.size = auto  // 120-10 32-10
e.borders.w = 10

### size and image fixed, has borders
e.size = 120 32                // 120 32
e.content.image.size = 120 32  // 120 32
e.borders.w = 10


# Target
Top Panel
Dock

Application selector
File Browser
Music player
Video player
Image viewer
PDF reader
Context menu
Context menu customize

Piano app
YouTube app + downloader
Telegram app

