DELIMITER //
DROP TRIGGER IF EXISTS tb_uf_validacao_I //
CREATE TRIGGER tb_uf_validacao_I
BEFORE INSERT ON tb_uf
FOR EACH ROW
BEGIN
	DECLARE UF_COUNT INT;
    DECLARE NOME_ESTADO_COUNT INT;
    
    IF NEW.uf = '' OR NEW.uf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo UF não pode ser vazio.';
	ELSEIF NEW.nome_estado = '' OR NEW.nome_estado IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Estado não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO UF_COUNT FROM tb_uf WHERE uf=NEW.uf;
    
    IF UF_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Esta UF já está cadastrada';
    END IF;
    
    SELECT COUNT(*) INTO NOME_ESTADO_COUNT FROM tb_uf WHERE nome_estado=NEW.nome_estado;
    
    IF NOME_ESTADO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome de Estado já está cadastrado';
    END IF;
    
END;//

DROP TRIGGER IF EXISTS tb_uf_validacao_A //
CREATE TRIGGER tb_uf_validacao_A
BEFORE UPDATE ON tb_uf
FOR EACH ROW
BEGIN
	DECLARE UF_COUNT INT;
    DECLARE NOME_ESTADO_COUNT INT;
    
	IF NEW.uf = '' OR NEW.uf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo UF não pode ser vazio.';
	ELSEIF NEW.nome_estado = ''  OR NEW.nome_estado IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Estado não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO UF_COUNT FROM tb_uf WHERE uf=NEW.uf AND id_uf<>NEW.id_uf;
    
    IF UF_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Esta UF já está cadastrada';
    END IF;
    
    SELECT COUNT(*) INTO NOME_ESTADO_COUNT FROM tb_uf WHERE nome_estado=NEW.nome_estado AND id_uf<>NEW.id_uf;
    
    IF NOME_ESTADO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome de Estado já está cadastrado';
    END IF;
    
END;//
DELIMITER ;