#!/bin/bash

# Get the name of the Odoo module
echo "Enter the name of the Odoo module:"
read MODULE_NAME

# Create the Odoo module structure
mkdir -p ${MODULE_NAME}/{models,views,security,data}

# Create the __init__.py files
cat > ${MODULE_NAME}/__init__.py << EOF
from . import models
from . import views
from . import security
from . import data
EOF

cat > ${MODULE_NAME}/models/__init__.py << EOF
from . import ${MODULE_NAME}
EOF

cat > ${MODULE_NAME}/views/__init__.py << EOF
from . import ${MODULE_NAME}_view
EOF

cat > ${MODULE_NAME}/security/__init__.py << EOF
from . import ir_model_access
EOF

touch ${MODULE_NAME}/data/__init__.py

# Create the manifest file
cat > ${MODULE_NAME}/__manifest__.py << EOF
{
    'name': '${MODULE_NAME}',
    'version': '1.0',
    'author': 'Your Name',
    'depends': ['base'],
    'data': [
        'security/ir.model.access.csv',
        'views/${MODULE_NAME}_view.xml',
    ],
}
EOF

# Create the security file
cat > ${MODULE_NAME}/security/ir_model_access.py << EOF
from odoo import models, fields, api

class IrModelAccess(models.Model):
    _inherit = 'ir.model.access'

    rule_${MODULE_NAME} = fields.Boolean('${MODULE_NAME} Access')

    @api.multi
    def write(self, vals):
        if 'rule_${MODULE_NAME}' in vals:
            self.env['ir.rule'].clear_cache()
        return super(IrModelAccess, self).write(vals)
EOF

# Create the model file
cat > ${MODULE_NAME}/models/${MODULE_NAME}.py << EOF
from odoo import models, fields

class ${MODULE_NAME^}(models.Model):
    _name = '${MODULE_NAME}'
    name = fields.Char('Name', required=True)
EOF

# Create the view file
cat > ${MODULE_NAME}/views/${MODULE_NAME}_view.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<odoo>
    <data>
        <record model="ir.ui.view" id="${MODULE_NAME}_form_view">
            <field name="name">${MODULE_NAME} Form View</field>
            <field name="model">${MODULE_NAME}</field>
            <field name="arch" type="xml">
                <form string="${MODULE_NAME}">
                    <header>
                        <button string="Save" type="object" name="save"/>
                        <button string="Cancel" special="cancel"/>
                    </header>
                    <sheet>
                        <group>
                            <field name="name"/>
                        </group>
                    </sheet>
                </form>
            </field>
        </record>
        <record model="ir.ui.view" id="${MODULE_NAME}_tree_view">
            <field name="name">${MODULE_NAME} Tree View</field>
            <field name="model">${MODULE_NAME}</field>
            <field name="arch" type="xml">
                <tree string="${MODULE_NAME}">
                    <field name="name"/>
                </tree>
            </field>
        </record>
        <record model="ir.actions.act_window" id="${MODULE_NAME}_list_action">
            <field name="name">${MODULE_NAME}</field>
            <field name="res_model">${MODULE_NAME}</field>
            <field name="view_mode">tree,form</field>
        </record>
        <menuitem id="menu_${MODULE_NAME}" name="${MODULE_NAME}" parent="base.menu_operations" sequence="10" action="${MODULE_NAME}_list_action"/>
    </data>
</odoo>
EOF
