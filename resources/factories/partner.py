# neste arquivo contém o PAYLOAD usado na automação

def factory_new_partner():
    partner = {
        'name': 'Pizzas Papito',
        'email': 'contato01@papito.com.br',
        'whatsapp': '11999999999',
        'business': 'Restaurante'
    }
    return partner

def factory_dup_name():
    partner = {
        'name': 'Adega do Zé',
        'email': 'contato01@jose.com.br',
        'whatsapp': '41999999999',
        'business': 'Conveniência'
    }
    return partner