# Bando de Dados

Exercícios de **Banco de Dados** em SQL do curso Técnico em Desenvolvimento de Sistemas.

Cada exercício é um script `.sql` que cria o banco de dados, as tabelas (com chaves primárias e estrangeiras) e insere os dados de exemplo. Os scripts ficam na pasta [`SQL`](SQL).

## Exercícios

| Arquivo | Banco | Tema | Tabelas |
|---|---|---|---|
| [`automotiva.sql`](SQL/automotiva.sql) | `db_automotiva` | Loja de peças automotivas | 9 |
| [`clinica.sql`](SQL/clinica.sql) | `db_clinica` | Clínica médica | 5 |
| [`concessionaria.sql`](SQL/concessionaria.sql) | `db_concessionaria` | Concessionária de carros | 2 |
| [`confeitaria.sql`](SQL/confeitaria.sql) | `db_confeitaria` | Confeitaria | 5 |
| [`limpeza.sql`](SQL/limpeza.sql) | `db_firma` | Empresa de produtos de limpeza | 5 |

## Detalhes

### Automotiva

Tabelas: `tbl_tipo_cliente`, `tbl_fornecedor`, `tbl_peca`, `tbl_cliente`, `tbl_fornecimento_peca`, `tbl_telefone`, `tbl_endereco`, `tbl_pedido` e `tbl_item_pedido`.

Tem tipos de cliente com percentual de desconto, fornecedores de peças e pedidos com seus itens.

### Clínica

Tabelas: `tbl_paciente`, `tbl_medico`, `tbl_convenio`, `tbl_endereco` e `tbl_consulta`.

Tem pacientes, médicos (identificados pelo CRM), convênios e as consultas que ligam médicos e pacientes.

### Concessionária

Tabelas: `tbl_carros` e `tbl_vendedores`.

Além de criar as tabelas, o script mostra comandos de manipulação de dados: `INSERT` de novos carros, `UPDATE` para corrigir modelo, ano e combustível, e para ligar vendedores aos carros, e `SELECT` para conferir o resultado.

### Confeitaria

Tabelas: `tbl_cliente`, `tbl_produto`, `tbl_pedido`, `tbl_telefone_cliente` e `tbl_item_pedido`.

Tem clientes com vários telefones (chave primária composta), produtos vendidos por quilo e pedidos com itens.

### Limpeza

Tabelas: `tbl_produto`, `tbl_cliente`, `tbl_pedido`, `tbl_endereco` e `tbl_telefone`.

Tem produtos por categoria, clientes com status e limite de crédito e pedidos com quantidade.

