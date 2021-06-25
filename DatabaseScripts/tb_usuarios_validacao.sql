DELIMITER //
DROP TRIGGER IF EXISTS tb_usuarios_validacao_I //
CREATE TRIGGER tb_usuarios_validacao_I
BEFORE INSERT ON tb_usuarios
FOR EACH ROW
BEGIN
	IF NEW.login = '' OR NEW.login IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Login não pode ser vazio.';
	END IF;
    
    IF NEW.senha = '' OR NEW.senha IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Senha não pode ser vazio.';
	END IF;
    
    IF NEW.id_perfil = '' OR NEW.id_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Perfil não pode ser vazio.';
	END IF;
    
END;//

DROP TRIGGER IF EXISTS tb_usuarios_validacao_A //
CREATE TRIGGER tb_usuarios_validacao_A
BEFORE UPDATE ON tb_usuarios
FOR EACH ROW
BEGIN
	IF NEW.login = '' OR NEW.login IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Login não pode ser vazio.';
	END IF;
    
    IF NEW.senha = '' OR NEW.senha IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Senha não pode ser vazio.';
	END IF;
    
    IF NEW.id_perfil = '' OR NEW.id_perfil IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Perfil não pode ser vazio.';
	END IF;
    
END;//
DELIMITER ;