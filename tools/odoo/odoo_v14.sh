#!/bin/bash
# make odoo v14 folders to start
cd .. 
cd ..
mkdir odoo_module_rename_me
cd odoo_module_rename_me
mkdir models
touch models/__init__.py
mkdir controllers
touch controllers/__init__.py
mkdir views
touch views/views.xml
mkdir security
mkdir wizard
touch wizard/__init__.py
mkdir report
mkdir data
mkdir demo
mkdir i18n

