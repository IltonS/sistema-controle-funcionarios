DELIMITER //
DROP TRIGGER IF EXISTS tb_cargos_validacao_I //
CREATE TRIGGER tb_cargos_validacao_I
BEFORE INSERT ON tb_cargos
FOR EACH ROW
BEGIN
	DECLARE NOME_CARGO_COUNT INT;
    
	IF NEW.nome_cargo = '' OR NEW.nome_cargo IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Cargo não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_CARGO_COUNT FROM tb_cargos WHERE nome_cargo=NEW.nome_cargo;
    
    IF NOME_CARGO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Cargo já está cadastrado.';
    END IF;
    
END;//

DROP TRIGGER IF EXISTS tb_cargos_validacao_A //
CREATE TRIGGER tb_cargos_validacao_A
BEFORE UPDATE ON tb_cargos
FOR EACH ROW
BEGIN
	DECLARE NOME_CARGO_COUNT INT;
    
	IF NEW.nome_cargo = '' OR NEW.nome_cargo IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Cargo não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_CARGO_COUNT FROM tb_cargos WHERE nome_cargo=NEW.nome_cargo AND id_cargo<>NEW.id_cargo;
    
    IF NOME_CARGO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Cargo já está cadastrado.';
    END IF;
    
END;//
DELIMITER ;