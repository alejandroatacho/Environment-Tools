#!/bin/bash
# make odoo template without bin scaffold command
cd ..
cd ..
if [ ! -d "odoo_module_rename_me" ]; then
mkdir odoo_module_rename_me
cd odoo_module_rename_me
mkdir models
touch models/init.py
mkdir controllers
touch controllers/init.py
mkdir views
touch views/views.xml
mkdir security
mkdir wizard
touch wizard/init.py
mkdir report
mkdir data
mkdir demo
mkdir i18n
touch __manifest__.py
echo "{
    'name': 'Module Name',
    'version': '1.0',
    'category': 'Extra Tools',
    'description': 'Module description',
    'author': 'Hinamizawa',
    'website': 'https://github.com/alejandroatacho',
    'depends': ['base'],
    'data': [
        'views/views.xml',
    ],
    'installable': True,
    'application': True,
    'auto_install': False,
}" > __manifest__.py
else
echo "odoo_module_rename_me already exists, skipping folder creation."
fi