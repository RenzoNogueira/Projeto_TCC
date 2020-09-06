-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Set-2020 às 04:16
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_auton`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nomeEstabelecimento` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_bancarios`
--

CREATE TABLE `dados_bancarios` (
  `idDados_Bancarios` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `tipoConta` varchar(100) DEFAULT NULL,
  `banco` varchar(100) DEFAULT NULL,
  `agencia` varchar(4) DEFAULT NULL,
  `operacao` varchar(3) DEFAULT NULL,
  `conta` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL,
  `causaSocial` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(80) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `idDados_Bancarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `exibir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `idMenu` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `qtdPedido` int(11) NOT NULL,
  `observacao` varchar(500) DEFAULT NULL,
  `idFornecedor` int(11) NOT NULL,
  `idDados_Bancarios` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `valorTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_produto`
--

CREATE TABLE `pedido_produto` (
  `pedido_idPedido` int(11) NOT NULL,
  `pedido_idFornecedor` int(11) NOT NULL,
  `pedido_idDados_Bancarios` int(11) NOT NULL,
  `pedido_idUsuario` int(11) NOT NULL,
  `pedido_idProduto` int(11) NOT NULL,
  `produto_idProduto` int(11) NOT NULL,
  `produto_idVenda` int(11) NOT NULL,
  `produto_idCliente` int(11) NOT NULL,
  `QtdPedida` int(11) NOT NULL,
  `ValorProduto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valorCusto` double NOT NULL,
  `valorVenda` double NOT NULL,
  `observacao` varchar(500) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idVenda` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `endereco` varchar(80) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `login` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `quantidadeVenda` int(11) NOT NULL,
  `observacao` varchar(500) DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `valorTotal` double DEFAULT NULL,
  `usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_produto`
--

CREATE TABLE `venda_produto` (
  `venda_idVenda` int(11) NOT NULL,
  `venda_idCliente` int(11) NOT NULL,
  `venda_idProduto` int(11) NOT NULL,
  `produto_idProduto` int(11) NOT NULL,
  `produto_idVenda` int(11) NOT NULL,
  `produto_idCliente` int(11) NOT NULL,
  `qtdVendida` int(11) NOT NULL,
  `valorVendida` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `dados_bancarios`
--
ALTER TABLE `dados_bancarios`
  ADD PRIMARY KEY (`idDados_Bancarios`);

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
-- Índices para tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD PRIMARY KEY (`idMenu`,`idPerfil`),
  ADD KEY `fk_Menu_has_Perfil_Perfil1_idx` (`idPerfil`),
  ADD KEY `fk_Menu_has_Perfil_Menu1_idx` (`idMenu`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`,`idFornecedor`,`idDados_Bancarios`,`idUsuario`,`idProduto`),
  ADD KEY `fk_Pedido_Fornecedor1_idx` (`idFornecedor`,`idDados_Bancarios`),
  ADD KEY `fk_Pedido_Usuario1_idx` (`idUsuario`);

--
-- Índices para tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD PRIMARY KEY (`pedido_idPedido`,`pedido_idFornecedor`,`pedido_idDados_Bancarios`,`pedido_idUsuario`,`pedido_idProduto`,`produto_idProduto`,`produto_idVenda`,`produto_idCliente`),
  ADD KEY `fk_pedido_has_produto_produto1_idx` (`produto_idProduto`,`produto_idVenda`,`produto_idCliente`),
  ADD KEY `fk_pedido_has_produto_pedido1_idx` (`pedido_idPedido`,`pedido_idFornecedor`,`pedido_idDados_Bancarios`,`pedido_idUsuario`,`pedido_idProduto`);

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
  ADD KEY `fk_Produto_Categoria_idx` (`idCategoria`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Perfil1_idx` (`idPerfil`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`,`idCliente`,`idProduto`,`usuario_idUsuario`),
  ADD KEY `fk_Venda_Cliente1_idx` (`idCliente`),
  ADD KEY `fk_venda_usuario1_idx` (`usuario_idUsuario`);

--
-- Índices para tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD PRIMARY KEY (`venda_idVenda`,`venda_idCliente`,`venda_idProduto`,`produto_idProduto`,`produto_idVenda`,`produto_idCliente`),
  ADD KEY `fk_venda_has_produto_produto1_idx` (`produto_idProduto`,`produto_idVenda`,`produto_idCliente`),
  ADD KEY `fk_venda_has_produto_venda1_idx` (`venda_idVenda`,`venda_idCliente`,`venda_idProduto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

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
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fk_Fornecedor_Dados_Bancarios1` FOREIGN KEY (`idDados_Bancarios`) REFERENCES `dados_bancarios` (`idDados_Bancarios`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_Menu_has_Perfil_Menu1` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Menu_has_Perfil_Perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Fornecedor1` FOREIGN KEY (`idFornecedor`,`idDados_Bancarios`) REFERENCES `fornecedor` (`idFornecedor`, `idDados_Bancarios`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD CONSTRAINT `fk_pedido_has_produto_pedido1` FOREIGN KEY (`pedido_idPedido`,`pedido_idFornecedor`,`pedido_idDados_Bancarios`,`pedido_idUsuario`,`pedido_idProduto`) REFERENCES `pedido` (`idPedido`, `idFornecedor`, `idDados_Bancarios`, `idUsuario`, `idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`produto_idProduto`,`produto_idVenda`,`produto_idCliente`) REFERENCES `produto` (`idProduto`, `idVenda`, `idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_Produto_Categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_Venda_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venda_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD CONSTRAINT `fk_venda_has_produto_produto1` FOREIGN KEY (`produto_idProduto`,`produto_idVenda`,`produto_idCliente`) REFERENCES `produto` (`idProduto`, `idVenda`, `idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_has_produto_venda1` FOREIGN KEY (`venda_idVenda`,`venda_idCliente`,`venda_idProduto`) REFERENCES `venda` (`idVenda`, `idCliente`, `idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
