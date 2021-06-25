DELIMITER //
DROP TRIGGER IF EXISTS tb_cargos_validacao_I //
CREATE TRIGGER tb_cargos_validacao_I
BEFORE INSERT ON tb_cargos
FOR EACH ROW
BEGIN
	IF NEW.nome_cargo = '' OR NEW.nome_cargo IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Cargo não pode ser vazio.';
	END IF;
END;//

DROP TRIGGER IF EXISTS tb_cargos_validacao_A //
CREATE TRIGGER tb_cargos_validacao_A
BEFORE UPDATE ON tb_cargos
FOR EACH ROW
BEGIN
	IF NEW.nome_cargo = '' OR NEW.nome_cargo IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Cargo não pode ser vazio.';
	END IF;
END;//
DELIMITER ;