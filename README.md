# Sistema de Acesso Remoto SSH Seguro

## 📋 Descrição
Repositório privado que armazena configurações e registro de clientes para acesso remoto SSH.
Funciona como "banco de dados" para o sistema de suporte remoto.

## 📁 Estrutura

```
.
├── next_port.txt       # Contador de próxima porta disponível
├── clients.json        # Lista de clientes registrados
├── config.template.json # Template de configuração (referência)
└── README.md           # Este arquivo
```

## 🔐 Segurança

- ⚠️ Este repositório DEVE ser PRIVADO
- ⚠️ Contém informações sensíveis de clientes
- ⚠️ Nunca fazer fork ou clonar em computador compartilhado
- ⚠️ GitHub token deve ter permissão apenas para este repositório

## 📝 Como usar

### Para técnico:
1. Clonar repositório (modo privado)
2. Ler `clients.json` para ver clientes disponíveis
3. Conectar via SSH com as credenciais registradas

### Para cliente:
1. Executar script `setup-ssh.ps1` do pendrive
2. Script atualiza automaticamente `next_port.txt` e `clients.json`
3. Aguardar conexão do técnico

## ⚙️ Formatos de Arquivo

### next_port.txt
Simples arquivo de texto com a próxima porta disponível:
```
2200
```

### clients.json
JSON estruturado com dados do cliente:
```json
{
  "clients": [
    {
      "id": "client_001",
      "computer_name": "PC-CLIENTE-001",
      "local_user": "usuario_local",
      "tech_user": "sshtech",
      "port": 2200,
      "ip_wan": "192.168.1.100",
      "registration_date": "2026-01-21T10:30:00Z",
      "last_connection": "2026-01-21T14:45:00Z",
      "status": "online",
      "notes": "Descrição opcional"
    }
  ],
  "metadata": {
    "version": "1.0",
    "last_updated": "2026-01-21T10:30:00Z",
    "total_clients": 1
  }
}
```

## 🚀 Fluxo Completo

1. **Cliente executa script** → Instala SSH, cria usuário técnico
2. **Script consulta GitHub** → Obtém próxima porta
3. **Script configura SSH** → Porta específica para cada cliente
4. **Script registra no GitHub** → Adiciona cliente à lista
5. **Técnico lê GitHub** → Via script local
6. **Técnico se conecta** → SSH direto ao cliente
7. **Sessão encerrada** → Técnico desconecta
8. **Apenas técnico controla** → Cliente nunca inicia conexão

## ⛔ Garantias de Segurança

✅ Nenhuma conexão reversa
✅ Nenhum túnel reverso
✅ Cliente nunca conecta no técnico
✅ PC técnico não expõe portas
✅ Apenas tecnico inicia sessões
✅ GitHub como "banco de dados", não como proxy

## 📞 Suporte
Consulte a documentação local em seu PC.
