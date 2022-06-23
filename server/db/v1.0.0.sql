-- add plugin entry in the plugin table
INSERT IGNORE INTO plugins (name, version) 
VALUES ('search', 'v1.0.0');

-- Add new style search
INSERT IGNORE INTO `styles` (`name`, `id_type`, id_group, description) VALUES ('search', '2', (select id from styleGroup where `name` = 'Input' limit 1), 'Add search input box. Used for pages that accept additional paramter. On click the text is assigned in the url and it can be used as a parameter');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) 
VALUES (get_style_id('search'), get_field_id('label'), '', 'Label for the button');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) 
VALUES (get_style_id('search'), get_field_id('placeholder'), '', 'Placeholder for the input field');
INSERT IGNORE INTO `fields` (`id`, `name`, `id_type`, `display`) VALUES (NULL, 'prefix', get_field_type_id('text'), '1');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) 
VALUES (get_style_id('search'), get_field_id('prefix'), '', 'Add prefix to the search text');
INSERT IGNORE INTO `fields` (`id`, `name`, `id_type`, `display`) VALUES (NULL, 'suffix', get_field_type_id('text'), '1');
INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `default_value`, `help`) 
VALUES (get_style_id('search'), get_field_id('suffix'), '', 'Add suffix to the search text');

INSERT IGNORE INTO `styles_fields` (`id_styles`, `id_fields`, `help`)
SELECT `id`, @id_field, "Allows to assign CSS classes to the root item of the style." FROM `styles` WHERE `name` = 'search';