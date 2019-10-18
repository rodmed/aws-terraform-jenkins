# Instruções

Requisitos
- Plataforma Linux com seguintes softwares instalados
	-  terraform (v.0.12 ou superior)[https://learn.hashicorp.com/terraform/getting-started/install.html]
	- awscli [https://docs.aws.amazon.com/cli/latest/userguide/install-linux-al2017.html] configurado e com permissões necessárias para criar instâncias e volumes. 
	- alterar o *subnet_id* ## [dev](https://github.com/rodmed/aws-terraform-jenkins/tree/master/dev)/**instances.tf** para um id de subnet  pública em que possa iniciar instâncias (pública ou que tenha acesso a um NAT para baixar atualizações via apt-get)

Observações: 
 - Estamos usando instância ***t2.micro***,  com uma imagem ***Ubuntu 19.04*** por padrão da região Leste dos EUA (Ohio) (***us-east-2***).
   Em [https://cloud-images.ubuntu.com/locator/ec2/](https://cloud-images.ubuntu.com/locator/ec2/) pode listar imagens para outras regiões selecionar uma imagem com tipo  *hvm:ebs-ssd* 
 - Hoje é esperada uma chave ssh para criar e acessar as instâncias ( será feito o upload com nome *mykeypair*  )
 - Jenkins é instalado por padrão na porta TCP 8080, certificar-se que o VPC Security Group Padrão(ou o fornecido) permite o tráfego para acessar.
