<script>
    $(function () {ldelim}
        $('#pdfSettings').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
        {rdelim});
</script>

<form
        class="pkp_form"
        id="pdfSettings"
        method="POST"
        action="{url router=$smarty.const.ROUTE_COMPONENT op="manage" category="blocks" plugin=$pluginName verb="settings" save=true}"
>
    <!-- Always add the csrf token to secure your form -->
    {csrf}

    {fbvFormArea}
        <div class="pkp_notification">
            <div class="notifyWarning">
                {translate key="Bem vindo ao plugin de fixação de pdf!
                Em seguida adicione um título para que os leitores saibam do que se trata o PDF.
                Selecione o arquivo PDF. Por fim, se necessário, escreva uma pequena descrição."}
            </div>
        </div>
		{fbvFormSection title="Título:"}
			{fbvElement type="text" id="pdfTitle" value=$pdfTitle}
		{/fbvFormSection}
		{fbvFormSection title="Selecione o Arquivo:"}
			{fbvElement type="text" id="pdfFile" value=$pdfFile}
            
		{/fbvFormSection}
		{fbvFormSection title="Descrição:"}
			{fbvElement type="text" id="pdfDescription" value=$pdfDescription}
		{/fbvFormSection}
		
		
		
    {/fbvFormArea}
    {fbvFormButtons submitText="common.save"}
</form>