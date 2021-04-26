# Desafio 1

Crie um programa utilizando sua linguagem de programação favorita que faça uma listagem simples do nome de alguns módulos do curso Full Cycle os trazendo de um banco de dados MySQL. Gere a imagem desse container e a publique no DockerHub.

Gere uma imagem do nginx que seja capaz que receber as solicitações http e encaminhá-las para o container.

Crie um repositório no github com todo o fonte do programa e das imagens geradas.

Crie um arquivo README.md especificando quais comandos precisamos executar para que a aplicação funcione recebendo as solicitações na porta 8080 de nosso computador. Lembrando que NÃO utilizaremos Docker-compose nesse desafio.

# Como executar

Para executar basta rodar o arquivo execute.sh e depois acessar: http://localhost:8080
Conteúdo do arquivo:

```sh
#!/bin/bash
#NETWORK
docker network create --driver bridge minharede

#DB
docker run --rm -d --network minharede --name mysql brunoapiou/mysql_pfa

#BACK-END
docker run --rm -d --network minharede --name myapp brunoapiou/app_pfa

#NGINX
docker run --rm -d --network minharede --name mynginx -p 8080:8080 brunoapiou/nginx_pfa
```
