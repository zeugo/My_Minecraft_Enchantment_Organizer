from api import MC_API

api = MC_API('MSI', 'MC_Data')

def print_list(lst):
    lines = []
    for i, row in enumerate(lst):
        values = [str(item) for item in row]
        lines.append(' - '.join(values))
        
    return '\n'.join(lines)
        
    

def list_enchantments(obtained):
    missing = api.get_missing_enchantments(obtained)
    return print_list(missing)



while True:
    user_input = input("Select command: ").lower()
    
    match user_input:
        ###LIST Enchantments
        case 'lst-mis':
            print('Id - Enchantment - Max level')
            print(list_enchantments(0))
            
        case 'lst-obt':
            print('Id - Enchantment - Max level')
            print(list_enchantments(1))
            
        case 'lst-ubt':
            print('Id - Enchantment - Max level')
            print((list_enchantments(-1)))
        
        ###UPDATE Encahntment    
        case 'upd-enc':
            id = input('Type in enchantment id: ')             
            status = input('Type in new status: ')
            api.update_enchantment(status, id)
            
            
        ###LIST Items
        case 'lst-itm':
            print(print_list(api.get_items(0)))
            
        case 'exit':
            break
        
        case _:
            print(f"The command '{user_input}', is not recognised. Please use 'help' to list all commands.")
            
    print()