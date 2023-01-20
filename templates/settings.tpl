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
                {translate key="plugins.blocks.pdf.cookie.warning"}
            </div>
        </div>
		{fbvFormSection title="plugins.blocks.pdf.pdf.title"}
			{fbvElement type="text" id="pdfTitle" value=$pdfTitle}
		{/fbvFormSection}
		{fbvFormSection title="plugins.blocks.pdf.pdf.file"}
			{fbvElement type="text" id="pdfFile" value=$pdfFile}
		{/fbvFormSection}
		{fbvFormSection title="plugins.blocks.pdf.pdf.description"}
			{fbvElement type="text" id="pdfDescription" value=$pdfDescription}
		{/fbvFormSection}
		
		
		
    {/fbvFormArea}
    {fbvFormButtons submitText="common.save"}
</form>