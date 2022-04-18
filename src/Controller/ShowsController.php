<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Shows;
class ShowsController extends AbstractController
{
    /**
     * @Route("/shows", name="app_shows")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Shows::class);
        $shows = $repository->findAll();
        
        return $this->render('shows/index.html.twig', [
            'shows' => $shows,
            'resource' => 'spectacles',
        ]);

    }
	 /**
     * @Route("/shows/{id}", name="shows_show")
     */
    public function show($id)
    {
        $repository = $this->getDoctrine()->getRepository(Shows::class);
        $show = $repository->find($id);

        return $this->render('shows/show.html.twig', [
            'show' => $show,
        ]);
    }

}
