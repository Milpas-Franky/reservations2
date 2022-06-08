<?php

namespace App\Controller;
use App\Form\CreateType;
use App\Form\DeletType;
use App\Form\UpdateType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Doctrine\Common\Collections\ArrayCollection;
use App\Entity\Shows;
use App\Entity\Users;
use App\Entity\Roles;
class AdminController extends AbstractController
{
    /**
     * @Route("/admin", name="app_admin")
	 * @IsGranted("ROLE_ADMIN")
     */
    public function index(): Response
    {
		if (!$this->isGranted('ROLE_ADMIN') )
		{
	      $this->denyAccessUnlessGranted('ROLE_ADMIN');	
         
	    }
		$name= $this->getUser()->getUsername();
       $repository = $this->getDoctrine()->getRepository(Shows::class);
        $shows = $repository->findAll();
        
        return $this->render('admin/index.html.twig', [
            'shows' => $shows,
            'resource' => 'Liste des spectacles',
			'nom' => $name,
			
        ]);
		
    }
	/**
     * @Route("/admin/{id}", name="admin_show")
     */
	 
    public function show($id, Security $security)
    {
        $name= $this->getUser()->getUsername();
        $repository = $this->getDoctrine()->getRepository(Shows::class);
        $show = $repository->find($id);
        return $this->render('admin/show.html.twig', [
            'show' => $show,
			'nom' => $name,
			
        ]);
    }
	
}
