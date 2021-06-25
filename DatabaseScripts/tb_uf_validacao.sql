DELIMITER //
DROP TRIGGER IF EXISTS tb_uf_validacao_I //
CREATE TRIGGER tb_uf_validacao_I
BEFORE INSERT ON tb_uf
FOR EACH ROW
BEGIN
	IF NEW.uf = '' OR NEW.uf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo UF não pode ser vazio.';
	ELSEIF NEW.nome_estado = '' OR NEW.nome_estado IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Estado não pode ser vazio.';
	END IF;
END;//

DROP TRIGGER IF EXISTS tb_uf_validacao_A //
CREATE TRIGGER tb_uf_validacao_A
BEFORE UPDATE ON tb_uf
FOR EACH ROW
BEGIN
	IF NEW.uf = '' OR NEW.uf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo UF não pode ser vazio.';
	ELSEIF NEW.nome_estado = ''  OR NEW.nome_estado IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Estado não pode ser vazio.';
	END IF;
END;//
DELIMITER ;