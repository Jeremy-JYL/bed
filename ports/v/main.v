module main

import os

const line_sep = 10

fn main() {
	println('BED - v0.0.1 - V')
	mut buffer := map[int]string{}
	for {
		userinput := os.input('> ').split(' ')
		if userinput[0].is_int() {
			buffer[userinput[0].int()] = userinput[1..userinput.len].join(' ')
		} else {
			match userinput[0].to_upper() {
				'LIST' {
					if userinput.len != 1 {
					  println('  ${userinput[1]} ${buffer[userinput[1].int()]}')
					} else {
						mut keys := buffer.keys()
						keys.sort()
						for i in keys {
							if buffer[i] != '' {
								println('  ${i} ${buffer[i]}')
							}
						}
					}
				}
				'LOAD' {
					content := os.read_lines(userinput[1]) or {
						println('Error while loading! ${err}')
						return
					}
					buffer.clear()
					mut counter := 0
					for i in content {
						if i != '' {
							buffer[counter] = i
							counter += line_sep
						}
					}
				}
				'SAVE' {
					mut keys := buffer.keys()
					mut content := []string{}
					keys.sort()
					for i in keys {
						if buffer[i] != '' {
							content << buffer[i]
						}
					}
					os.write_lines(userinput[1], content) or {
						println('Error while saving! ${err}')
						return
					}
				}
				'NEW' {
					buffer.clear()
				}
				'EXIT' {
					buffer.clear()
					break
				}
				'' {}
				else {
					println('? Unknown command! ${userinput[0]}')
				}
			}
		}
	}
}
