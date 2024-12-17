
DELIMITER $$

CREATE FUNCTION HTMLDecode(input TEXT) RETURNS TEXT
BEGIN
	DECLARE output TEXT;
    SET output = input;
    
    SET output = REPLACE(output, '&Auml;', 'Ä');
    SET output = REPLACE(output, '&Euml;', 'Ë');
    SET output = REPLACE(output, '&Iuml;', 'Ï');
    SET output = REPLACE(output, '&Ouml;', 'Ö');
    SET output = REPLACE(output, '&Uuml;', 'Ü');
    
    SET output = REPLACE(output, '&auml;', 'ä');
    SET output = REPLACE(output, '&euml;', 'ë');
    SET output = REPLACE(output, '&iuml;', 'ï');
    SET output = REPLACE(output, '&ouml;', 'ö');
    SET output = REPLACE(output, '&uuml;', 'ü');
    
    SET output = REPLACE(output, '&Aacute;', 'Á');
    SET output = REPLACE(output, '&Eacute;', 'É');
    SET output = REPLACE(output, '&Iacute;', 'Í');
    SET output = REPLACE(output, '&Oacute;', 'Ó');
    SET output = REPLACE(output, '&Uacute;', 'Ú');
    SET output = REPLACE(output, '&Uacute;', 'Ý');
    
    SET output = REPLACE(output, '&aacute;', 'á');
    SET output = REPLACE(output, '&eacute;', 'é');
    SET output = REPLACE(output, '&iacute;', 'í');
    SET output = REPLACE(output, '&oacute;', 'ó');
    SET output = REPLACE(output, '&uacute;', 'ú');
    SET output = REPLACE(output, '&yacute;', 'ý');

    SET output = REPLACE(output, '&Agrave;', 'À');
    SET output = REPLACE(output, '&Egrave;', 'È');
    SET output = REPLACE(output, '&Igrave;', 'Ì');
    SET output = REPLACE(output, '&Ograve;', 'Ò');
    SET output = REPLACE(output, '&Ugrave;', 'Ù');
    
    SET output = REPLACE(output, '&agrave;', 'à');
    SET output = REPLACE(output, '&egrave;', 'è');
    SET output = REPLACE(output, '&igrave;', 'ì');
    SET output = REPLACE(output, '&ograve;', 'ò');
    SET output = REPLACE(output, '&ugrave;', 'ù');
    
    SET output = REPLACE(output, '$Atilde;', 'Ã');
    SET output = REPLACE(output, '$Ntilde;', 'Ñ');
    SET output = REPLACE(output, '$Otilde;', 'Õ');
    
    SET output = REPLACE(output, '$atilde;', 'ã');
    SET output = REPLACE(output, '$ntilde;', 'ñ');
    SET output = REPLACE(output, '$otilde;', 'õ');

    SET output = REPLACE(output, '&Aring;', 'Å');
    SET output = REPLACE(output, '&aring;', 'å');
    SET output = REPLACE(output, '&AElig;', 'Æ');
    SET output = REPLACE(output, '&aelig;', 'æ');
    SET output = REPLACE(output, '&Ccedil;', 'Ç');
    SET output = REPLACE(output, '&ccedil;', 'ç');
    SET output = REPLACE(output, '&ETH;', 'Ð');
    SET output = REPLACE(output, '&eth;', 'ð');
    SET output = REPLACE(output, '&THORN;', 'Þ');
    SET output = REPLACE(output, '&thorn;', 'þ');
    
	SET output = REPLACE(output, '&szlig;', 'ß');
    SET output = REPLACE(output, '&amp;', '&');
    SET output = REPLACE(output, '&lt;', '<');
    SET output = REPLACE(output, '&gt;', '>');
    
    RETURN output;
END $$

DELIMITER ;

SELECT 
	name, 
	HTMLDecode(name) AS 'TEST'
FROM mhl_suppliers
WHERE
	name LIKE '%&%;%'
ORDER BY name
LIMIT 25

-- DROP FUNCTION IF EXISTS HTMLDecode;