# PdfBlockPlugin para ojs
-baixe

-coloque em plugins/block

-(OBS: para funcionar, deve editar o arquivo block.tpl na linha 3 para o nome da pasta onde o projeto está salvo:http://0.0.0.0:8888/plugins/blocks/NOMEDAPASTA/logopdf.png"

-no arquivo settings.tpl, nas linhas 39 e 56 editar para o nome de uma das revistas que você tem acesso: 
0.0.0.0:8888/index.php/SUAREVISTA/$$$call$$$/grid/settings/library/library-file-admin-grid/add-file

-adicione nas configurações do site e revista

-em settings coloque "título", "link externo de pdf"(POR ENQUANTO) e "descrição"

-//em ADDFILE, ABRIRÁ UMA PÁGINA, da qual é só salvar o arquivo, essa página refere-se a workflow - publisher library.

-em aparencia escolha o local onde aparecerá

-cada revista gera suas descrições


![image](https://user-images.githubusercontent.com/114300053/214059122-f7f1666b-a369-48ea-abd6-bb95437e16f1.png)





ainda falta arrumar bastante coisa
///FALTA://

1) enquanto os arquivos upados estão sendo direcionados a uma revista específica, independente da revista onde é editada as infos do plugin. exemplo, o plugin foi criado com base na revista "A", se for usado na revista "B", o pdf upado vai para no banco da revista "A".


2) falta encontrar forma de referenciar o link gerado de pdf "http://0.0.0.0:8888/index.php/mercurio/$$$call$$$/api/file/file-api/download-library-file?libraryFileId=""""NNNNNN""""" ,(sendo """"NNNNNN""""" gerado quando salva o pdf) ao logo do plugin.


3) Talvez, fazer com que o código do arquivo settings.tpl, não direceione para nenhuma revista, e sim para uma pasta específica, ou fazer com que o codigo deste arquivo mude (if else) para a revista em edição atual automaticamente.


