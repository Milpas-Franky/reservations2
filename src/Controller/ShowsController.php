<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Shows;
use App\Entity\Users;
use App\Entity\Roles;
class ShowsController extends AbstractController
{
    /**
     * @Route("/shows", name="app_shows")
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
        
        return $this->render('shows/index.html.twig', [
            'shows' => $shows,
            'resource' => 'spectacles',
			'nom' => $name,
			
        ]);

    }
	 /**
     * @Route("/shows/{id}", name="shows_show")
     */
    public function show($id)
    {
        $name= $this->getUser()->getUsername();
        $repository = $this->getDoctrine()->getRepository(Shows::class);
        $show = $repository->find($id);
        return $this->render('shows/show.html.twig', [
            'show' => $show,
			'nom' => $name,
			
        ]);
    }

}
