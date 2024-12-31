#!/usr/bin/env python3

def handle_input(input_value):
    if not input_value:
        print_ascii_table()
        return

    if len(input_value) == 1:
        char = input_value
        ascii_val = ord(char)
        print(f"字符 {char} 的 ASCII 码值是: {ascii_val:3d}")
    else:
        try:
            ascii_val = int(input_value)
            if 0 <= ascii_val <= 127:
                char_info = get_char_info(ascii_val)
                print(f"ASCII 码值 {ascii_val:3d} 对应的字符是: {char_info}")
            else:
                print("无效的输入：请输入一个 0 到 127 之间的 ASCII 码值")
        except ValueError:
            print("无效的输入：请输入一个字符或一个有效的 ASCII 码值")

def print_ascii_table():
    print("       Dec   Hex   Char                        Dec   Hex   Char")
    print("       ───────────────────────────────────────────────────────────")

    for i in range(0, 64):
        next_i = i + 64

        if next_i < 128:
            line = (f"       {i:3d}    {i:02X}   {get_char_info(i):<26}  {next_i:3d}    {next_i:02X}   {get_char_info(next_i)}")
        else:
            line = (f"       {i:3d}    {i:02X}   {get_char_info(i)}")

        print(line)

def get_char_info(code):
    if code == 0: return "NUL '\\0' (null character)"
    elif code == 1: return "SOH (start of heading)"
    elif code == 2: return "STX (start of text)"
    elif code == 3: return "ETX (end of text)"
    elif code == 4: return "EOT (end of transmission)"
    elif code == 5: return "ENQ (enquiry)"
    elif code == 6: return "ACK (acknowledge)"
    elif code == 7: return "BEL '\\a' (bell)"
    elif code == 8: return "BS  '\\b' (backspace)"
    elif code == 9: return "HT  '\\t' (horizontal tab)"
    elif code == 10: return "LF  '\\n' (new line)"
    elif code == 11: return "VT  '\\v' (vertical tab)"
    elif code == 12: return "FF  '\\f' (form feed)"
    elif code == 13: return "CR  '\\r' (carriage ret)"
    elif code == 14: return "SO  (shift out)"
    elif code == 15: return "SI  (shift in)"
    elif code == 16: return "DLE (data link escape)"
    elif code == 17: return "DC1 (device control 1)"
    elif code == 18: return "DC2 (device control 2)"
    elif code == 19: return "DC3 (device control 3)"
    elif code == 20: return "DC4 (device control 4)"
    elif code == 21: return "NAK (negative ack.)"
    elif code == 22: return "SYN (synchronous idle)"
    elif code == 23: return "ETB (end of trans. blk)"
    elif code == 24: return "CAN (cancel)"
    elif code == 25: return "EM  (end of medium)"
    elif code == 26: return "SUB (replace)"
    elif code == 27: return "ESC (escape)"
    elif code == 28: return "FS  (file separator)"
    elif code == 29: return "GS  (group separator)"
    elif code == 30: return "RS  (record separator)"
    elif code == 31: return "US  (unit separator)"
    elif code == 32: return "SPACE"
    elif code == 127: return "DEL (delete)"
    else: return f"{chr(code)}"

if __name__ == "__main__":
    import sys

    if len(sys.argv) != 2:
        print_ascii_table()
    else:
        handle_input(sys.argv[1])