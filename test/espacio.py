# crea una funcion que lea un archivo memfile.mem y en cada linea de texto es de 8 caracteres quiero haga un espacio cada 2 caracteres y lo guardes en un archivo
# llamado memfile2.mem
# ejemplo:
# memfile.mem
# 12345678
# 12345678
# 12345678
# 12345678

# memfile2.mem
# 12 34 56 78
# 12 34 56 78

def espacio():
    with open('memfile.mem', 'r') as file:
        with open('memfile2.mem', 'w') as file2:
            for line in file:
                for i in range(0, len(line), 2):
                    file2.write(line[i:i+2] + ' ')
                    #que no haya espacio antes de los primero caracteres
                

espacio()
