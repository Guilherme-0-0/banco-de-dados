PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS alunos (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    data_nascimento DATE,
    cpf TEXT UNIQUE,
    email TEXT
);

CREATE TABLE IF NOT EXISTS professores (
    id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT,
    especialidade TEXT
);

CREATE TABLE IF NOT EXISTS disciplinas (
    id_disciplina INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    carga_horaria INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS turmas (
    id_turma INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    ano INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS professor_disciplina (
    id_professor INTEGER,
    id_disciplina INTEGER,
    PRIMARY KEY (id_professor, id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS matriculas (
    id_matricula INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER,
    id_turma INTEGER,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS notas (
    id_nota INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER,
    id_disciplina INTEGER,
    nota REAL CHECK (nota >= 0 AND nota <= 10),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina) ON DELETE CASCADE
);
