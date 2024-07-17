use mydb;

insert into paises 
	(id, nome)
values
	(1, "Argentina"),
	(2, "Bolívia"),
	(3, "Brasil"),
	(4, "Chile"),
	(5, "Colômbia"),
	(6, "Equador"),
	(7, "Guiana"),
	(8, "Paraguai"),
	(9, "Peru"),
	(10, "Suriname"),
	(11, "Uruguai"),
	(12, "Venezuela");
    
insert into departamento 
	(id, nome, media_salarial)
values
	(1, "tecnologia", 3000),
	(2, "administração", 2000),
	(3, "finanças", 2500),
	(4, "transportes", 2500),
	(5, "inovações", 4000),
	(6, "gerente", 5000);

insert into dados_pessoais
	(id, cpf, rg, telefone)
values
	(1, "00000001", "00000001", "00000001"),
    (2, "00000002", "00000002", "00000002"),
    (3, "00000003", "00000003", "00000003"),
	(4, "00000004", "00000004", "00000004"),
    (5, "00000005", "00000005", "00000005"),
    (6, "00000006", "00000006", "00000006"),
	(7, "00000007", "00000007", "00000007"),
    (8, "00000008", "00000008", "00000008"),
    (9, "00000009", "00000009", "00000009"),
    (10, "00000010", "00000010", "00000010"),
    (11, "00000011", "00000011", "00000011"),
    (12, "00000012", "00000012", "00000012"),
    (13, "00000013", "00000013", "00000013"),
    (14, "00000014", "00000014", "00000014"),
    (15, "00000015", "00000015", "00000015"),
    (16, "00000016", "00000016", "00000016"),
    (17, "00000017", "00000017", "00000017"),
    (18, "00000018", "00000018", "00000018");

insert into funcionarios
	(id, nome, posicao, salario, dados_pessoais_id, departamento_id, paises_id)
values
	(1, "Jublisqueide Feraz", "Desenvolvedor Full-Stack", 4000, 1, 1, 3),
    (2, "Bruno Silva", "Desenvolvedor Front-End", 3000, 2, 1, 3),
    (3, "Carlos Oliveira", "Desenvolvedor Back-End", 3000, 3, 1, 3),
    (4, "Daniela Ferreira", "Administrador de Empresas", 2400, 4, 2, 1),
    (5, "Eduardo Costa", "Analista Financeiro", 3100, 5, 3, 2),
    (6, "Fernanda Lima", "Gerente de Logística", 2800, 6, 4, 4),
    (7, "Gabriel Rocha", "Especialista em Inovação", 4100, 7, 5, 5),
    (8, "Helena Santos", "Gerente de Projetos", 5000, 8, 6, 6),
    (9, "Igor Almeida", "Analista de Redes", 4000, 9, 1, 7),
    (10, "Júlia Martins", "Administrador de Empresas", 2400, 10, 2, 8),
    (11, "Lucas Pereira", "Analista Financeiro", 3100, 11, 3, 9),
    (12, "Mariana Carvalho", "Gerente de Logística", 2800, 12, 4, 10),
    (13, "Nelson Ribeiro", "Especialista em Inovação", 4100, 13, 5, 11),
    (14, "Otávio Mendes", "Gerente de Projetos", 5000, 14, 6, 12),
    (15, "Patrícia Fernandes", "Analista de Redes", 3000, 15, 1, 1),
    (16, "Ricardo Monteiro", "Administrador de Empresas", 2400, 16, 2, 2),
    (17, "Tatiana Barbosa", "Analista Financeiro", 3100, 17, 3, 3),
    (18, "Rodrigo Feraz", "Gerente de Logística", 2800, 18, 4, 4);

insert into filhos 
	(id, nome)
values
	(1, "Paulo Azevedo"),
	(2, "Renata Mendes"),
	(3, "Thiago Nogueira"),
	(4, "Vitória Braga"),
	(5, "Samuel Antunes"),
	(6, "Clara Figueiredo"),
	(7, "Felipe Amaral");
    
insert into funcionarios_filhos
	(funcionarios_id, filhos_id)
values
	(4, 1),
    (5, 2),
    (6, 3),
    (8, 4),
    (10, 5),
    (13, 6),
    (15, 7);

insert into conjuge 
	(id, nome)
values
	(1, "Renata Azevedo"),
	(2, "Paulo Mendes"),
	(3, "Samuel Nogueira"),
	(4, "Vitória Braga"),
	(5, "Felipe Antunes"),
	(6, "Renata Figueiredo"),
	(7, "Clara Amaral");
    
insert into funcionarios_conjuge
	(funcionarios_id, conjuge_id)
values
	(1, 1),
    (5, 2),
    (7, 3),
    (11, 4),
    (13, 5),
    (14, 6),
    (18, 7);
    
-- Quantos funcionários temos ao total na empresa?

select count(*) from funcionarios;

-- Quantos funcionários temos no departamento de finanças?

select count(f.id) 
from funcionarios as f
inner join departamento as d
on d.id = f.departamento_id
where d.id = 3;

-- Qual a média salarial do departamento de tecnologia?

select media_salarial from departamento;

-- Quanto o departamento de Transportes gasta em salários?

select SUM(salario) 
from funcionarios
where departamento_id = 3;

-- Três novos funcionários foram contratados para o departamento de inovações. 
-- Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, possuem uma filha chamada Maria Antônia que tem 1 anos e adora brincar com cachorros. 
-- Ele será programador.

-- Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. 
-- Ela vai ocupar a posição de desenvolvedora.  

-- Por último, a Gerente do departamento será Sumaia Azevedo. 
-- Casada com Juliana Freitas, duas filhas (Tainã e Nathalia).

-- O salário de todos eles será a média salarial dos departamentos de administração e finanças.

insert into dados_pessoais
	(id, cpf, rg, telefone)
values
	(19, "00000019", "00000019", "00000019"),
    (20, "00000020", "00000020", "00000020"),
    (21, "00000021", "00000021", "00000021");

insert into funcionarios 
	(id, nome, posicao, salario, dados_pessoais_id, departamento_id, paises_id)
values
	(19, "William Ferreira", "Programador", 2250, 19, 5, 3),
    (20, "Fernanda Lima", "Desenvolvedor", 2250, 20, 5, 3),
    (21, "Sumaia Azevedo", "Gerente do departamento", 2250, 21, 6, 3);
    
insert into filhos 
	(id, nome)
values
	(8, "Maria Antônia"),
    (9, "Tainã"),
    (10, "Nathalia");
    
insert into funcionarios_filhos
	(funcionarios_id, filhos_id)
values
    (19, 8),
    (21, 9),
    (21, 10);

insert into conjuge 
	(id, nome)
values
	(8, "Inara Ferreira"),
    (9, "Rodrigo"),
    (10, "Juliana Freitas");
    
insert into funcionarios_conjuge
	(funcionarios_id, conjuge_id)
values
    (19, 8),
    (20, 9),
    (21, 10);
    
-- Informe todas as regiões em que a empresa atua acompanhadas de seus países.

select nome from paises;

-- Exiba o nome cada funcionário acompanhado de seus dependentes.

select fu.nome, fi.nome 
from funcionarios as fu
inner join funcionarios_filhos as ff
on ff.funcionarios_id = fu.id
inner join filhos as fi
on ff.filhos_id = fi.id;

