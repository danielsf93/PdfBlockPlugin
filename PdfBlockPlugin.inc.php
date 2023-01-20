<?php
import('lib.pkp.classes.plugins.BlockPlugin');

class PdfBlockPlugin extends BlockPlugin
{
	//enables plugin site-wide
	public function isSitePlugin()
	{
		return true;
	}

	public function getDisplayName()
	{
		return __('tentativa pdf');
	}


	public function getDescription()
	{
		return __('Block para subir pdf de referencia');
	}

	public function getContents($templateMgr, $request = null)
	{
		$context = Application::get()->getRequest()->getContext();
		$contextId = ($context && $context->getId()) ? $context->getId() : CONTEXT_SITE;
		$templateMgr->assign('pdfTitle', $this->getSetting($contextId, 'pdfTitle'));
		$templateMgr->assign('pdfFile', $this->getSetting($contextId, 'pdfFile'));
		$templateMgr->assign('pdfDescription', $this->getSetting($contextId, 'pdfDescription'));
		
		return parent::getContents($templateMgr, $request);
	}

	public function getActions($request, $actionArgs)
	{
		$actions = parent::getActions($request, $actionArgs);
		if (!$this->getEnabled()) {
			return $actions;
		}
		$router = $request->getRouter();
		import('lib.pkp.classes.linkAction.request.AjaxModal');
		$linkAction = new LinkAction(
			'settings',
			new AjaxModal(
				$router->url(
					$request,
					null,
					null,
					'manage',
					null,
					array(
						'verb' => 'settings',
						'plugin' => $this->getName(),
						'category' => 'blocks'
					)
				),
				$this->getDisplayName()
			),
			__('manager.plugins.settings'),
			null
		);
		array_unshift($actions, $linkAction);
		return $actions;
	}

	public function manage($args, $request)
	{
		switch ($request->getUserVar('verb')) {
			case 'settings':
				$this->import('PdfBlockPluginSettingsForm');
				$form = new PdfBlockPluginSettingsForm($this);
				if (!$request->getUserVar('save')) {
					$form->initData();
					return new JSONMessage(true, $form->fetch($request));
				}
				$form->readInputData();
				if ($form->validate()) {
					$form->execute();
					return new JSONMessage(true);
				}
		}
		return parent::manage($args, $request);
	}
}
