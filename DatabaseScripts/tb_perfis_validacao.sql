DELIMITER //
DROP TRIGGER IF EXISTS tb_perfis_validacao_I //
CREATE TRIGGER tb_perfis_validacao_I
BEFORE INSERT ON tb_perfis
FOR EACH ROW
BEGIN
	DECLARE NOME_PERFIL_COUNT INT;
    
	IF NEW.nome_perfil = '' OR NEW.nome_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Perfil não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_PERFIL_COUNT FROM tb_perfis WHERE nome_perfil=NEW.nome_perfil;
    
    IF NOME_PERFIL_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Perfil já está cadastrado.';
    END IF;
    
END;//

DROP TRIGGER IF EXISTS tb_perfis_validacao_A //
CREATE TRIGGER tb_perfis_validacao_A
BEFORE UPDATE ON tb_perfis
FOR EACH ROW
BEGIN
	DECLARE NOME_PERFIL_COUNT INT;
    
	IF NEW.nome_perfil = '' OR NEW.nome_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Perfil não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_PERFIL_COUNT FROM tb_perfis WHERE nome_perfil=NEW.nome_perfil AND id_perfil<>NEW.id_perfil;
    
    IF NOME_PERFIL_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Perfil já está cadastrado.';
    END IF;
    
END;//
DELIMITER ;