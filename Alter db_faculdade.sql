ALTER TABLE departamento
CHANGE COLUMN nome_departamento nome_departamento CHAR(20) NOT NULL;

ALTER TABLE professor
CHANGE COLUMN nome_professor nome_professor CHAR(20) NOT NULL;

ALTER TABLE professor
CHANGE COLUMN sobrenome_professor sobrenome_professor CHAR(50) NOT NULL;

ALTER TABLE professor
CHANGE COLUMN status status BOOLEAN;

ALTER TABLE disciplina
CHANGE COLUMN carga_horaria carga_horaria INTEGER(4) NOT NULL,	
CHANGE COLUMN num_aluno num_aluno INTEGER(4) NOT NULL;

ALTER TABLE endereco
CHANGE COLUMN nome_rua nome_rua CHAR(50) NOT NULL,
CHANGE COLUMN numero_rua numero_rua INTEGER(4) NOT NULL,
CHANGE COLUMN complemento complemento CHAR(20) NOT NULL,
CHANGE COLUMN CEP CEP CHAR(8) NOT NULL;

ALTER TABLE endereco
MODIFY COLUMN fk_cod_tipo_logradouro INTEGER(4) NOT NULL;

ALTER TABLE telefone_aluno
MODIFY COLUMN fk_RA INTEGER(4) NOT NULL,
MODIFY COLUMN fk_cod_telefone integer(4) NOT NULL;

ALTER TABLE historico
MODIFY COLUMN fk_RA INTEGER(4) NOT NULL;

ALTER TABLE professor_disciplina
MODIFY COLUMN fk_cod_professor INTEGER(4) NOT NULL,
MODIFY COLUMN fk_cod_disciplina INTEGER(4) NOT NULL;

ALTER TABLE curso_disciplina
MODIFY COLUMN fk_cod_curso INTEGER(4) NOT NULL,
MODIFY COLUMN fk_cod_disciplina INTEGER(4) NOT NULL;

ALTER TABLE disciplina_historico
MODIFY COLUMN fk_cod_historico INTEGER(4) NOT NULL,
MODIFY COLUMN fk_cod_disciplina INTEGER(4) NOT NULL;

ALTER TABLE aluno_disciplina
MODIFY COLUMN fk_RA INTEGER(4) NOT NULL,
MODIFY COLUMN fk_cod_disciplina INTEGER(4) NOT NULL;

ALTER TABLE aluno_disciplina
ADD PRIMARY KEY (fk_RA, fk_cod_disciplina);

ALTER TABLE curso_disciplina
ADD PRIMARY KEY (fk_cod_curso, fk_cod_disciplina);

ALTER TABLE disciplina_historico
ADD PRIMARY KEY (fk_cod_historico, fk_cod_disciplina);

ALTER TABLE professor_disciplina
ADD PRIMARY KEY (fk_cod_professor, fk_cod_disciplina);

DROP TABLE telefone_aluno;

CREATE TABLE IF NOT EXISTS telefone_aluno (
    cod_tel_aluno INTEGER(4) PRIMARY KEY AUTO_INCREMENT,
    fk_RA INTEGER(4) NOT NULL,
    fk_cod_telefone INTEGER(4) NOT NULL,
FOREIGN KEY (fk_RA) REFERENCES aluno (RA),
FOREIGN KEY (fk_cod_telefone) REFERENCES telefone (cod_telefone)
);