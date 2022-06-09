<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Shows;
use App\Entity\Users;
use App\Entity\Roles;
class ProchainSpectacleController extends AbstractController
{
    /**
     * @Route("/prochain/spectacle", name="app_prochain_spectacle")
     */
    public function index(): Response
    {
		 if (!$this->getUser()->getRoles()) 
		{
			 
			  $name= $this->getUser()->getUsername();
		      $role='ROLE_MEMBER';
			  
		}
        else    
        {
			 
			  $name= $this->getUser()->getUsername();
		      $role= implode($this->getUser()->getRoles());
		}	 
        $repository = $this->getDoctrine()->getRepository(Shows::class);
        $shows = $repository->findAll();
        
        return $this->render('prochain_spectacle/index.html.twig', [
            'shows' => $shows,
            'resource' => 'Prochains spectacles',
			'nom' => $name,
			
        ]);
           
			
    }
}
