-- 1. Criar a tabela Localiza��o
CREATE TABLE Localizacao (
    LocalizacaoID INT PRIMARY KEY IDENTITY(1,1), -- Chave prim�ria com auto incremento
    Cidade NVARCHAR(100) NOT NULL,
    Estado NVARCHAR(100) NOT NULL
);

-- 2. Adicionar a coluna LocalizacaoID na tabela Empreendimentos
ALTER TABLE Empreendimentos
ADD LocalizacaoID INT;

-- 3. Criar a rela��o entre Empreendimentos e Localizacao
ALTER TABLE Empreendimentos
ADD CONSTRAINT FK_Empreendimentos_Localizacao
FOREIGN KEY (LocalizacaoID) REFERENCES Localizacao(LocalizacaoID);

-- 4. (Opcional) Inserir dados na tabela Localizacao para testar
INSERT INTO Localizacao (Cidade, Estado)
VALUES
('S�o Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG');

-- 5. (Opcional) Atualizar a tabela Empreendimentos com LocalizacaoID
-- Substitua os IDs abaixo pelos valores reais que correspondem �s cidades/estados na tabela Localizacao
UPDATE Empreendimentos
SET LocalizacaoID = 1 -- Exemplo: Vinculando ao LocalizacaoID correspondente a 'S�o Paulo'
WHERE EmpreendimentoID = 1; -- Substitua pelo ID do empreendimento real
