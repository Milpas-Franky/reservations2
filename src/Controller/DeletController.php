<?php

namespace App\Controller;
use App\Form\DeleteType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Doctrine\Common\Collections\ArrayCollection;
use App\Entity\Shows;
use App\Entity\Users;
use App\Entity\Roles;
use App\Entity\Locations;
use App\Entity\Locality;

class DeletController extends AbstractController
{
    /**
     * @Route("/delet", name="app_delet")
	 * @IsGranted("ROLE_ADMIN")
     */
    public function index(Request $request): Response
    {
        $name= $this->getUser()->getUsername();
		$show= new Shows();
		 $form = $this->createForm(DeleteType::class, $show);		 
         $form->handleRequest($request);
        return $this->render('delet/index.html.twig', [
            'nom' => $name,
			'formindex' => $form->createView()
        ]);
    }
}
