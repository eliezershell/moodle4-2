# Moodle 4.2.2 Installation Script

Este repositório contém um script para facilitar a instalação do Moodle 4.2 em sistemas baseados no Ubuntu e Debian. O script automatiza o processo de instalação, configurando os requisitos mínimos, incluindo Apache 2, MySQL e PHP 8.1, juntamente com todas as extensões necessárias para executar o PHP 8.1.

## Pré-requisitos

Antes de começar, certifique-se de que seu sistema atenda aos seguintes requisitos:

- **Ubuntu 22.04** ou distribuição baseada no **Debian**

## Instalação

Siga estas etapas para instalar o Moodle 4.2 em seu sistema:

1. **Clone este repositório:**
   ```
   git clone https://github.com/eliezershell/moodle4-2.git
   ```

2. **Execute o script de instalação:**
   ```
   cd moodle4-2
   chmod +x install.sh
   ./install.sh
   ```
   
## Notas Adicionais

- **Testado no Ubuntu 22.04:** Este script foi testado e aprovado no Ubuntu 22.04. Recomendamos usar este sistema operacional para garantir a compatibilidade.
  
- **Suporte a Outras Distribuições:** Embora tenha sido testado no Ubuntu 22.04, este script também deve funcionar em outras distribuições baseadas no Debian. Se você encontrar problemas em outras versões, por favor, informe-nos.

- **Problemas e Suporte:** Se encontrar problemas durante o processo de instalação ou precisar de suporte, sinta-se à vontade para abrir uma [issue](https://github.com/eliezershell/moodle4-2/issues) neste repositório. Estamos aqui para ajudar.

Esperamos que este script facilite sua experiência de instalação do Moodle 4.2! Se tiver sugestões para melhorias ou encontrar bugs, por favor, compartilhe conosco.