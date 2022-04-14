<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Locality;

class LocalityController extends AbstractController
{
	/**
     * @Route("/locality", name="app_locality")
	 */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Locality::class);
        $localities = $repository->findAll();

        return $this->render('locality/index.html.twig', [
            'localities' => $localities,
            'resource' => 'localitées',

        ]);
    }

        /**
     * @Route("/locality/{id}", name="locality_show")
     */
    public function show($id)
    {
        $repository = $this->getDoctrine()->getRepository(Locality::class);
       $localitie = $repository->find($id);

        return $this->render('locality/show.html.twig', [
            'localitie' => $localitie,
        ]); 
    }

}
