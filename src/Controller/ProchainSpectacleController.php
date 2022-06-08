<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProchainSpectacleController extends AbstractController
{
    /**
     * @Route("/prochain/spectacle", name="app_prochain_spectacle")
     */
    public function index(): Response
    {
		if ($this->getUser()->getUsername() == NULL) { throw new \Exception('This should never be reached!'); }
            
        else {$name= $this->getUser()->getUsername();}
        return $this->render('prochain_spectacle/index.html.twig', [
            'controller_name' => 'ProchainSpectacleController',
			'nom' => $name,
        ]);
    }
}
