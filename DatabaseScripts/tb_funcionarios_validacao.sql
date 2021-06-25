DELIMITER //
DROP TRIGGER IF EXISTS tb_funcionarios_validacao_I //
CREATE TRIGGER tb_funcionarios_validacao_I
BEFORE INSERT ON tb_funcionarios
FOR EACH ROW
BEGIN
	DECLARE NOME_FUNCIONARIO_COUNT INT;
    DECLARE CPF_COUNT INT;
    DECLARE DATA_NASCIMENTO_COUNT INT;
    
	IF NEW.nome_funcionario = '' OR NEW.nome_funcionario IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Funcionário não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_FUNCIONARIO_COUNT FROM tb_funcionarios WHERE nome_funcionario=NEW.nome_funcionario;
    
    IF NOME_FUNCIONARIO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Funcionário já está cadastrado.';
    END IF;
    
    IF NOT REGEXP_LIKE(NEW.cpf,'\\d{11}')  OR NEW.cpf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'CPF Inválido';
	END IF;
    
    SELECT COUNT(*) INTO CPF_COUNT FROM tb_funcionarios WHERE cpf = NEW.cpf;
    
    IF CPF_COUNT > 0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este CPF já está cadastrado';
    END IF;
    
    IF NEW.data_nascimento IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'O campo Data de Nascimento não pode ser vazio.';
    END IF;
    
END;//

DROP TRIGGER IF EXISTS tb_funcionarios_validacao_A //
CREATE TRIGGER tb_funcionarios_validacao_A
BEFORE UPDATE ON tb_funcionarios
FOR EACH ROW
BEGIN
	DECLARE NOME_FUNCIONARIO_COUNT INT;
    DECLARE CPF_COUNT INT;
    DECLARE DATA_NASCIMENTO_COUNT INT;
    
	IF NEW.nome_funcionario = '' OR NEW.nome_funcionario IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Campo Nome do Funcionário não pode ser vazio.';
	END IF;
    
    SELECT COUNT(*) INTO NOME_FUNCIONARIO_COUNT FROM tb_funcionarios WHERE nome_funcionario=NEW.nome_funcionario AND id_funcionario<>NEW.id_funcionario;
    
    IF NOME_FUNCIONARIO_COUNT >0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este Nome do Funcionário já está cadastrado.';
    END IF;
    
    IF NOT REGEXP_LIKE(NEW.cpf,'\\d{11}')  OR NEW.cpf IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'CPF Inválido';
	END IF;
    
    SELECT COUNT(*) INTO CPF_COUNT FROM tb_funcionarios WHERE cpf = NEW.cpf AND id_funcionario<>NEW.id_funcionario;
    
    IF CPF_COUNT > 0 THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Este CPF já está cadastrado';
    END IF;
    
    IF NEW.data_nascimento IS NULL THEN
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'O campo Data de Nascimento não pode ser vazio.';
    END IF;
    
END;//
DELIMITER ;