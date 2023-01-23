# PdfBlockPlugin para ojs
-baixe

-coloque em plugins/block

-(OBS: para funcionar, deve editar o arquivo block.tpl na linha 3 para o nome da pasta onde o projeto está salvo:http://0.0.0.0:8888/plugins/blocks/NOMEDAPASTA/logopdf.png"

-no arquivo settings.tpl, nas linhas 39 e 56 editar para o nome de uma das revistas que você tem acesso: 
0.0.0.0:8888/index.php/SUAREVISTA/$$$call$$$/grid/settings/library/library-file-admin-grid/add-file

-adicione nas configurações do site e revista

-em settings coloque, na aba #Site url# coloque o url de sua revista, exemplo: http://0.0.0.0:8888/index.php/MINHAREVISTA. (Isso garantirá que o botão ADDFILE funcione(mas ainda não clique nele)) 

-adicione o "título" e "descrição"
-Salve

-Clique novamente em Settings, e agora sim em ADDFILE.

-em ADDFILE, ABRIRÁ UMA PÁGINA, da qual é só salvar o arquivo, essa página refere-se a workflow - publisher library da própria revista.

-salve o arquivo em modo público



---------------------------
Defina o local onde o plugin aparecerá em sua revista

-em aparencia escolha o local onde aparecerá

-cada revista gera suas descrições


![image](https://user-images.githubusercontent.com/114300053/214059122-f7f1666b-a369-48ea-abd6-bb95437e16f1.png)





ainda falta arrumar bastante coisa
///FALTA://

1) enquanto os arquivos upados estão sendo direcionados a uma revista específica, independente da revista onde é editada as infos do plugin. exemplo, o plugin foi criado com base na revista "A", se for usado na revista "B", o pdf upado vai para no banco da revista "A", por mais que o painel utilizado como ADDFILE seja da revista "A". O problema é editar a referencia do arquivo settings.tpl na linha 59, pois onde é:

""url": "http://0.0.0.0:8888/index.php/um/$$$call$$$/grid/settings/library/library-file-admin-grid/add-file"," deveria ficar algo (que funcione) como:
""url": $perfecturl", ou
""url": $siteurl . "/$$$call$$$/grid/settings/library/library-file-admin-grid/add-file"". E explicando, $siteurl equivale à #Site url#  dos primeiros passos.


2) falta encontrar forma de referenciar o link gerado de pdf "http://0.0.0.0:8888/index.php/mercurio/$$$call$$$/api/file/file-api/download-library-file?libraryFileId=""""NNNNNN""""" ,(sendo """"NNNNNN""""" gerado quando salva o pdf) ao logo do plugin. é possível ver esse link em workflow > publisher > (selecione algum) > edit. o link é algo como "http://0.0.0.0:8888/index.php/mercurio/libraryFiles/downloadPublic/10", que é mais simples


3) referenciar esse link obtido na linha 04 do arquivo block.tpl


