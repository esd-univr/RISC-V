def convert_hex_to_mem(input_hex_file, output_mem_file):
    """
    Converts a formatted hex file into a Verilog-compatible .mem file.
    
    :param input_hex_file: Path to the input hex file.
    :param output_mem_file: Path to the output .mem file.
    """
    with open(input_hex_file, 'r') as infile, open(output_mem_file, 'w') as outfile:
        for line in infile:
            # Skip lines starting with '@' (address labels)
            if line.startswith('@'):
                continue
            
            # Remove whitespace and split hex bytes
            hex_bytes = line.strip().split()
            
            # Combine every 4 bytes into a 32-bit word
            for i in range(0, len(hex_bytes), 4):
                word = ''.join(hex_bytes[i:i+4])  # Concatenate 4 bytes
                outfile.write(word + '\n')       # Write as a single word

# Example usage
convert_hex_to_mem('program.hex', 'program.mem')

