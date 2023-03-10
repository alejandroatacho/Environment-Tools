
#!/bin/bash
# make odoo v14 folders to start
cd .. 
cd ..
mkdir odoo_module_rename_me
cd odoo_module_rename_me
mkdir models controllers views security wizard report data demo i18n
touch models/__init__.py controllers/__init__.py views/views.xml wizard/__init__.py
