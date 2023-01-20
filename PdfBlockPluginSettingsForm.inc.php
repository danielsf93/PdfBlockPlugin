<?php

import('lib.pkp.classes.form.Form');

class PdfBlockPluginSettingsForm extends Form
{


    public $plugin;

    public function __construct($plugin)
    {
        parent::__construct($plugin->getTemplateResource('settings.tpl'));
        $this->plugin = $plugin;
        $this->addCheck(new FormValidatorPost($this));
        $this->addCheck(new FormValidatorCSRF($this));
    }

    /**
     * Load settings already saved in the database
     *
     * Settings are stored by context, so that each journal or press
     * can have different settings.
     */
    public function initData()
    {
    	$request = Application::get()->getRequest();
	    $context = $request->getContext();
	    $contextId = ($context && $context->getId()) ? $context->getId() : CONTEXT_SITE;
        $this->setData('pdfTitle', $this->plugin->getSetting($contextId, 'pdfTitle'));
        $this->setData('pdfFile', $this->plugin->getSetting($contextId, 'pdfFile'));
        $this->setData('pdfDescription', $this->plugin->getSetting($contextId, 'pdfDescription'));
        
        parent::initData();
    }

    /**
     * Load data that was submitted with the form
     */
    public function readInputData()
    {
        $this->readUserVars(['pdfTitle', 'pdfFile', 'pdfDescription']);
        parent::readInputData();
    }

	/**
	 * Fetch any additional data needed for your form.
	 *
	 * Data assigned to the form using $this->setData() during the
	 * initData() or readInputData() methods will be passed to the
	 * template.
	 * @param $request
	 * @param null $template
	 * @param bool $display
	 * @return string|null
	 */
    public function fetch($request, $template = null, $display = false)
    {
        $templateMgr = TemplateManager::getManager($request);
        $templateMgr->assign('pluginName', $this->plugin->getName());
        return parent::fetch($request, $template, $display);
    }

	/**
	 * Save the settings
	 * @param mixed ...$functionArgs
	 * @return mixed|null
	 */
    public function execute(...$functionArgs)
    {
	    $request = Application::get()->getRequest();
	    $context = $request->getContext();
	    $contextId = ($context && $context->getId()) ? $context->getId() : CONTEXT_SITE;
        $this->plugin->updateSetting($contextId, 'pdfTitle', $this->getData('pdfTitle'));
        $this->plugin->updateSetting($contextId, 'pdfFile', $this->getData('pdfFile'));
        $this->plugin->updateSetting($contextId, 'pdfDescription', $this->getData('pdfDescription'));
        
        import('classes.notification.NotificationManager');
        $notificationMgr = new NotificationManager();
        $notificationMgr->createTrivialNotification(
            $request->getUser()->getId(),
            NOTIFICATION_TYPE_SUCCESS,
            ['contents' => __('common.changesSaved')]
        );
        return parent::execute();
    }
}
