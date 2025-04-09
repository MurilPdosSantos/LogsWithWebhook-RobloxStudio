# Documentação do Script de Log e Webhook

Este script tem como objetivo facilitar o envio de mensagens de log e erros para um **Webhook** via **Discord** ou outro serviço similar. Ele utiliza o **HttpService** do Roblox para enviar dados para um webhook configurado. O script é modular e pode ser adaptado facilmente para diferentes casos de uso.

## Estrutura do Script

O script está estruturado de forma que ele se conecta a um **Webhook** e permite o envio de logs e erros, formatados com informações de data e hora. O script utiliza a função `os.date` para capturar o horário atual e envia essas informações junto com a mensagem ao Webhook.

### Funções Disponíveis

#### 1. `Console.CreateHookMassage(url, title, message, color)`

Envia uma mensagem personalizada ao webhook com as informações de data e hora.

**Parâmetros:**
- `url`: URL do Webhook (normalmente fornecida pelo Discord ou outro serviço de webhook).
- `title`: O título da mensagem (geralmente usado para identificar a categoria do log ou erro).
- `message`: A descrição ou o corpo da mensagem.
- `color`: Cor da mensagem no formato hexadecimal (como `0x02e1f5` para azul).

**Exemplo de uso:**

```lua
Console.CreateHookMassage(
    "https://seu.webhook.url",
    "Exemplo de Título",
    "Exemplo de mensagem com informações.",
    tonumber(0x02e1f5) -- Azul
)
