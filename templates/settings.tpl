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
		


			<li>
				
<a href="http://0.0.0.0:8888/index.php/mercurio/$$$call$$$/grid/settings/library/library-file-admin-grid/add-file" id="component-grid-settings-library-libraryfileadmingrid-addFile-button-63ce8c6567305" title="Add a file" class="pkp_controllers_linkAction pkp_linkaction_addFile pkp_linkaction_icon_add">Add a file</a>

<script>
		$(function() {
		$('#component-grid-settings-library-libraryfileadmingrid-addFile-button-63ce8c6567305').pkpHandler(
			'$.pkp.controllers.linkAction.LinkActionHandler',
				{
		staticId: "component-grid-settings-library-libraryfileadmingrid-addFile-button",
		actionRequest: "$.pkp.classes.linkAction.ModalRequest",
	actionRequestOptions: {
					"title": "Add a file",
					"titleIcon": "modal_add_file",
					"canClose": "1",
					"closeOnFormSuccessId": null,
					"closeCleanVueInstances": [],
					"closeButtonText": "Close Panel",
					"modalHandler": "$.pkp.controllers.modal.AjaxModalHandler",
					"url": "http:\/\/0.0.0.0:8888\/index.php\/mercurio\/$$$call$$$\/grid\/settings\/library\/library-file-admin-grid\/add-file",
			}
}
			);
	});
</script>
		</li>
	
		
		
    {/fbvFormArea}
    {fbvFormButtons submitText="common.save"}
</form>