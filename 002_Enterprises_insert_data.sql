INSERT INTO Empreendimentos (Nome, Endereco, Status, Construtora, FaixaPrecoMin, FaixaPrecoMax, TotalUnidades)
VALUES
('Residencial Bella Vista', 'Rua das Flores, 123, Bairro A', 'Lançamento', 'Construtora A', 300000.00, 500000.00, 100),
('Edifício Porto Seguro', 'Av. Central, 456, Bairro B', 'Em Construção', 'Construtora B', 500000.00, 800000.00, 80);

INSERT INTO Tipologias (EmpreendimentoID, Descricao, AreaMedia, PrecoMedio, UnidadesDisponiveis)
VALUES
(1, 'Apartamento 2 quartos', 65.00, 350000.00, 50),
(1, 'Apartamento 3 quartos', 85.00, 450000.00, 50),
(2, 'Apartamento 2 quartos', 70.00, 550000.00, 40),
(2, 'Apartamento 3 quartos', 90.00, 750000.00, 40);

INSERT INTO Unidades (TipologiaID, NumeroQuartos, NumeroBanheiros, VagasGaragem, AreaPrivativa, Preco, LinkAnuncio)
VALUES
(1, 2, 2, 1, 65.00, 350000.00, 'https://exemplo.com/anuncio1'),
(1, 2, 2, 1, 65.00, 360000.00, 'https://exemplo.com/anuncio2'),
(2, 3, 3, 2, 85.00, 450000.00, 'https://exemplo.com/anuncio3'),
(3, 2, 2, 1, 70.00, 550000.00, 'https://exemplo.com/anuncio4'),
(4, 3, 3, 2, 90.00, 750000.00, 'https://exemplo.com/anuncio5');
