DELIMITER //
DROP TRIGGER IF EXISTS tb_funcionarios_validacao_I //
CREATE TRIGGER tb_funcionarios_validacao_I
BEFORE INSERT ON tb_funcionarios
FOR EACH ROW
BEGIN
	DECLARE CPF_COUNT INT;
    
	IF NEW.nome_funcionario = '' OR NEW.nome_funcionario IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Funcionário não pode ser vazio.';
	END IF;
    
    IF NOT REGEXP_LIKE(NEW.cpf,'\\d{11}')  OR NEW.cpf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'CPF Inválido';
	END IF;
    
    SELECT COUNT(*) INTO CPF_COUNT FROM tb_funcionarios WHERE cpf = NEW.cpf;
    
    IF CPF_COUNT > 0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este CPF já está cadastrado';
    END IF;
END;//

DROP TRIGGER IF EXISTS tb_funcionarios_validacao_A //
CREATE TRIGGER tb_funcionarios_validacao_A
BEFORE UPDATE ON tb_funcionarios
FOR EACH ROW
BEGIN
	DECLARE CPF_COUNT INT;
    
	IF NEW.nome_funcionario = '' OR NEW.nome_funcionario IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Funcionário não pode ser vazio.';
	END IF;
    
    IF NOT REGEXP_LIKE(NEW.cpf,'\\d{11}')  OR NEW.cpf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'CPF Inválido';
	END IF;
    
    SELECT COUNT(*) INTO CPF_COUNT FROM tb_funcionarios WHERE cpf = NEW.cpf AND id_funcionario<>NEW.id_funcionario;
    
    IF CPF_COUNT > 0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este CPF já está cadastrado';
    END IF;
END;//
DELIMITER ;