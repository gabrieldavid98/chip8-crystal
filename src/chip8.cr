require "./cpu.cr"

module Chip8
   VERSION = "0.1.0"
   FONTSET = StaticArray[
     0xF0, 0x90, 0x90, 0x90, 0xF0, # 0
     0x20, 0x60, 0x20, 0x20, 0x70, # 1
     0xF0, 0x10, 0xF0, 0x80, 0xF0, # 2
     0xF0, 0x10, 0xF0, 0x10, 0xF0, # 3
     0x90, 0x90, 0xF0, 0x10, 0x10, # 4
     0xF0, 0x80, 0xF0, 0x10, 0xF0, # 5
     0xF0, 0x80, 0xF0, 0x90, 0xF0, # 6
     0xF0, 0x10, 0x20, 0x40, 0x40, # 7
     0xF0, 0x90, 0xF0, 0x90, 0xF0, # 8
     0xF0, 0x90, 0xF0, 0x10, 0xF0, # 9
     0xF0, 0x90, 0xF0, 0x90, 0x90, # A
     0xE0, 0x90, 0xE0, 0x90, 0xE0, # B
     0xF0, 0x80, 0x80, 0x80, 0xF0, # C
     0xE0, 0x90, 0x90, 0x90, 0xE0, # D
     0xF0, 0x80, 0xF0, 0x80, 0xF0, # E
     0xF0, 0x80, 0xF0, 0x80, 0x80, # F
   ].map(&.to_u8)

   DISPLAY_WIDTH = 64
   DISPLAY_HEIGHT = 32
   DISPLAY_SIZE = Chip8::DISPLAY_WIDTH * Chip8::DISPLAY_HEIGHT
   SPRITE_WIDTH = 8u8
   RAM_SIZE = 4096
   REGISTERS = 16
   STACK_SIZE = 16
   KEYS = 16
end