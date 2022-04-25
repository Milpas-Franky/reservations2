<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\RepresentationsUsers;
class RepresentationsUsersController extends AbstractController
{
    /**
     * @Route("/representations_users", name="app_representations_users")
     */
    public function index(): Response
    {
       $repository = $this->getDoctrine()->getRepository(RepresentationsUsers::class) ;
       $representationusers = $repository->findAll();
	   
        return $this->render('representations_users/index.html.twig', 
		 ['representationusers' => $representationusers,
            'resource' => ' réservations',
        ]);

    }
	/**
     * @Route("/representations_users/{id}", name="representations_users_show")
     */
    public function show($id)
    {
        $repository = $this->getDoctrine()->getRepository(RepresentationsUsers::class);
        $representationuser = $repository->find($id);

        return $this->render('representations_users/show.html.twig', [
            'representationuser' => $representationuser,
			'resource' => 'Réservation de :',
        ]);
    }
}
