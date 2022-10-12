# neste arquivo contém o PAYLOAD usado na automação

def factory_enable_partner():
    partner = {
        'name': 'Posto do Papito',
        'email': 'doceria@gmail.com',
        'whatsapp': '11999999999',
        'business': 'Conveniência'
    }
    return partner

def factory_disable_partner():
    partner = {
        'name': 'Mercado noite',
        'email': 'mnoite@gmail.com',
        'whatsapp': '11999999999',
        'business': 'Supermercado'
    }
    return partner

def factory_new_partner():
    partner = {
        'name': 'Pizzas Papito',
        'email': 'contato01@papito.com.br',
        'whatsapp': '11999999999',
        'business': 'Restaurante'
    }
    return partner

def factory_404_partner():
    partner = {
        'name': 'Frangão',
        'email': 'contato01@frangao.com.br',
        'whatsapp': '41999999999',
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

def factory_partner_list():
    p_list = [
        {
        'name': 'Mercearia do Joaquim',
        'email': 'contato01@joaquim.com.br',
        'whatsapp': '41999999999',
        'business': 'Conveniência'
        },
        {
        'name': 'Mercadinho do Baixin',
        'email': 'contato01@baixin.com.br',
        'whatsapp': '51777777777',
        'business': 'Supermercado'
        },
        {
        'name': 'Restaurante KiGostoso',
        'email': 'contato01@kigostoso.com.br',
        'whatsapp': '31666666666',
        'business': 'Restaurante'
        }
    ]

    return p_list