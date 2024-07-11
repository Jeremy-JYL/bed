line_sep = 10

print('BED - v0.0.1 - Python/Micropython')
buffer = {}

while True:
    userinput = input('> ').split()
    if userinput[0].isdigit():
        buffer[int(userinput[0])] = " ".join(userinput[1:])
    else:
        match userinput[0].upper():
            case 'LIST':
                if len(userinput) != 1:
                    try:
                        print(f'  {userinput[1]} {buffer[int(userinput[1])]}')
                    except:
                        print(f'  {userinput[1]}')
                else:
                    keys = list(buffer.keys())
                    keys.sort()
                    for i in keys:
                        if buffer[i] != '':
                            print(f'  {i} {buffer[i]}')
            case 'LOAD':
                try:
                    with open(userinput[1], 'r') as f:
                        content = f.readlines()
                        buffer.clear()
                        counter = 0
                        for i in content:
                            if i != '':
                                buffer[counter] = i
                                counter += line_sep
                except Exception as e:
                    print(f'Error while loading! {e}')
            case 'SAVE':
                keys = list(buffer.keys())
                content = []
                keys.sort()
                for i in keys:
                    if buffer[i] != '':
                        content.append(buffer[i])
                try:
                    with open(userinput[1], "w") as f:
                        f.writelines(content)
                except Exception as e:
                        print(f'Error while saving! {e}')
            case 'NEW':
                buffer.clear()
            case 'EXIT':
                buffer.clear()
                break
            case '':
                pass
            case _:
                print(f'? Unknown command! {userinput[0]}')
