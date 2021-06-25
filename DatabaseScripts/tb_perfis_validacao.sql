DELIMITER //
DROP TRIGGER IF EXISTS tb_perfis_validacao_I //
CREATE TRIGGER tb_perfis_validacao_I
BEFORE INSERT ON tb_perfis
FOR EACH ROW
BEGIN
	IF NEW.nome_perfil = '' OR NEW.nome_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Perfil não pode ser vazio.';
	END IF;
END;//

DROP TRIGGER IF EXISTS tb_perfis_validacao_A //
CREATE TRIGGER tb_perfis_validacao_A
BEFORE UPDATE ON tb_perfis
FOR EACH ROW
BEGIN
	IF NEW.nome_perfil = '' OR NEW.nome_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Perfil não pode ser vazio.';
	END IF;
END;//
DELIMITER ;