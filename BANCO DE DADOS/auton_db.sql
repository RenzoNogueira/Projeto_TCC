-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 09-Ago-2020 às 16:32
-- Versão do servidor: 5.7.24
-- versão do PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `auton_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`idAdministrador`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `idVenda` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `NomeEstabelecimento` varchar(100) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `Endereco` varchar(80) DEFAULT NULL,
  `Sexo` varchar(1) NOT NULL,
  `Telefone` varchar(11) NOT NULL,
  `Cep` varchar(8) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idAdministrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_bancarios`
--

CREATE TABLE `dados_bancarios` (
  `idDados_Bancarios` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `TipoConta` varchar(100) DEFAULT NULL,
  `Banco` varchar(100) DEFAULT NULL,
  `Agencia` varchar(4) DEFAULT NULL,
  `NOperacao` varchar(3) DEFAULT NULL,
  `NConta` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `idProduto` int(11) NOT NULL,
  `Quantidade` int(11) DEFAULT NULL,
  `idRelatorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL,
  `CausaSocial` varchar(100) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Endereco` varchar(80) NOT NULL,
  `Cep` varchar(8) NOT NULL,
  `Telefone` varchar(11) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `idDados_Bancarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Link` varchar(100) NOT NULL,
  `Icone` varchar(45) DEFAULT NULL,
  `Exibir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_has_perfil`
--

CREATE TABLE `menu_has_perfil` (
  `idMenu` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `QuantidadePedido` int(11) NOT NULL,
  `Observacao` varchar(500) DEFAULT NULL,
  `idFornecedor` int(11) NOT NULL,
  `idDados_Bancarios` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `Nome`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Cadastro_Produtocol` varchar(45) NOT NULL,
  `ValorCusto` double NOT NULL,
  `ValorVenda` double NOT NULL,
  `Observacao` varchar(500) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idVenda` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio`
--

CREATE TABLE `relatorio` (
  `idRelatorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `DataNascimento` datetime NOT NULL,
  `Endereco` varchar(80) NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `Telefone` varchar(11) NOT NULL,
  `Cep` varchar(8) DEFAULT NULL,
  `Login` varchar(15) NOT NULL,
  `Senha` varchar(15) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `Email` varchar(100) DEFAULT NULL,
  `idAdministrador` tinyint(4) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nome`, `CPF`, `DataNascimento`, `Endereco`, `Sexo`, `Telefone`, `Cep`, `Login`, `Senha`, `ativo`, `Email`, `idAdministrador`, `idPerfil`) VALUES
(12, 'Admin', '05297924006', '2020-08-18 13:30:15', 'a', 'm', '999999999', '11111', 'admin', '123', 1, 'email@a.com', 1, 1),
(13, 'User1', '05297924006', '2020-08-18 13:30:15', 'a', 'm', '999999999', '11111', 'user1', '123', 1, 'email@a.com', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `QuantidadeVenda` int(11) NOT NULL,
  `Observacao` varchar(500) DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`,`idVenda`,`idCliente`),
  ADD KEY `fk_Categoria_Venda1_idx` (`idVenda`,`idCliente`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fk_Cliente_Usuario1_idx` (`idUsuario`,`idAdministrador`);

--
-- Índices para tabela `dados_bancarios`
--
ALTER TABLE `dados_bancarios`
  ADD PRIMARY KEY (`idDados_Bancarios`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`idProduto`,`idRelatorio`),
  ADD KEY `fk_Estoque_Relatorio1_idx` (`idRelatorio`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idFornecedor`,`idDados_Bancarios`),
  ADD KEY `fk_Fornecedor_Dados_Bancarios1_idx` (`idDados_Bancarios`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Índices para tabela `menu_has_perfil`
--
ALTER TABLE `menu_has_perfil`
  ADD PRIMARY KEY (`idMenu`,`idPerfil`),
  ADD KEY `fk_Menu_has_Perfil_Perfil1_idx` (`idPerfil`),
  ADD KEY `fk_Menu_has_Perfil_Menu1_idx` (`idMenu`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`,`idFornecedor`,`idDados_Bancarios`,`idUsuario`,`idProduto`),
  ADD KEY `fk_Pedido_Fornecedor1_idx` (`idFornecedor`,`idDados_Bancarios`),
  ADD KEY `fk_Pedido_Usuario1_idx` (`idUsuario`),
  ADD KEY `fk_Pedido_Estoque1_idx` (`idProduto`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`,`idVenda`,`idCliente`),
  ADD KEY `fk_Produto_Categoria_idx` (`idCategoria`),
  ADD KEY `fk_Produto_Venda1_idx` (`idVenda`,`idCliente`);

--
-- Índices para tabela `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`idRelatorio`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idPerfil` (`idPerfil`) USING BTREE,
  ADD KEY `fk_Usuario_Administrador1_idx` (`idAdministrador`) USING BTREE;

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`,`idCliente`,`idProduto`),
  ADD KEY `fk_Venda_Cliente1_idx` (`idCliente`),
  ADD KEY `fk_Venda_Estoque1_idx` (`idProduto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dados_bancarios`
--
ALTER TABLE `dados_bancarios`
  MODIFY `idDados_Bancarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idFornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `idMenu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `idRelatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_Categoria_Venda1` FOREIGN KEY (`idVenda`,`idCliente`) REFERENCES `venda` (`idVenda`, `idCliente`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Cliente_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_Estoque_Relatorio1` FOREIGN KEY (`idRelatorio`) REFERENCES `relatorio` (`idRelatorio`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fk_Fornecedor_Dados_Bancarios1` FOREIGN KEY (`idDados_Bancarios`) REFERENCES `dados_bancarios` (`idDados_Bancarios`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_has_perfil`
--
ALTER TABLE `menu_has_perfil`
  ADD CONSTRAINT `fk_Menu_has_Perfil_Menu1` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Menu_has_Perfil_Perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Estoque1` FOREIGN KEY (`idProduto`) REFERENCES `estoque` (`idProduto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pedido_Fornecedor1` FOREIGN KEY (`idFornecedor`,`idDados_Bancarios`) REFERENCES `fornecedor` (`idFornecedor`, `idDados_Bancarios`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_Produto_Categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Produto_Venda1` FOREIGN KEY (`idVenda`,`idCliente`) REFERENCES `venda` (`idVenda`, `idCliente`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Administrador1` FOREIGN KEY (`idAdministrador`) REFERENCES `administrador` (`idAdministrador`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Usuario_Perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_Venda_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Venda_Estoque1` FOREIGN KEY (`idProduto`) REFERENCES `estoque` (`idProduto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
