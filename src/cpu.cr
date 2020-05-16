require "./chip8.cr"

module Chip8
   class CPU
      def initialize
         @ram = StaticArray(UInt8, RAM_SIZE).new 0x00
         @display = StaticArray(UInt8, DISPLAY_SIZE).new 0x00
         @v = StaticArray(UInt8, REGISTERS).new 0x00

         @stack = StaticArray(UInt16, STACK_SIZE).new 0x00
         @keypad = StaticArray(UInt16, KEYS).new 0x00

         @i = 0u16
         @pc = 0x200u16
         @sp = 0u8
         @dt = 0u8
         @st = 0u8
         @draw_flag = false
         @opcode = 0u16

         load_fontset
         puts @ram
      end

      def draw?
         @draw_flag
      end

      def drawn
         @draw_flag = false
      end

      def load_rom(file)
         rom = File.read(file)
         rom.each_byte.each_with_index do |byte, index|
            @ram[0x200 + index] = byte
         end
      end

      def game_loop 
         loop do 
         end
      end

      private def cycle
         opcode = @ram[@pc] << 8 | @ram[@pc + 1]

         read_instruction opcode
      end

      private def read_instruction(opcode)
         x = (opcode & 0x0f00) >> 8
         y = (opcode & 0x00f0) >> 4

         @pc += 2
      end

      private def load_fontset
         FONTSET.each_with_index do |font, index|
            @ram[index] = font
         end
      end
   end
end
