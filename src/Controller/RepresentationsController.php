<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Representations;
class RepresentationsController extends AbstractController
{
    /**
     * @Route("/representations", name="app_representations")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Representations::class);
        $representations = $repository->findAll();
        
        return $this->render('representations/index.html.twig', [
            'representations' => $representations,
            'resource' => 'représentations',
        ]);

    }
	 /**
     * @Route("/representations/{id}", name="representations_show")
     */
    public function show($id)
    {
        $repository = $this->getDoctrine()->getRepository(Representations::class);
        $representation = $repository->find($id);

        return $this->render('representations/show.html.twig', [
            'representation' => $representation,
			
        ]);
    }

}
