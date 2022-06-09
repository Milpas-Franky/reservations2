<?php

namespace App\Controller;
use App\Form\UpdateType;
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

class UpdatController extends AbstractController
{
    /**
     * @Route("/updat/{id}", name="app_updat")
	 * @IsGranted("ROLE_ADMIN")
     */
    public function index(Request $request, $id):response
    {
         $name= $this->getUser()->getUsername();
		$em = $this->getDoctrine()->getManager();
        $show = $this->getDoctrine()->getRepository(Shows::class);
        $show = $show->find($id);
        $form = $this->createForm(UpdateType::class, $show);
		$form->handleRequest($request);
        if ($form->isSubmitted()) 
		{
            $show = $form->getData();
			$em->flush();
			return $this->redirect($this->generateUrl('app_admin'));
           
        }

       return $this->render('updat/index.html.twig', [
		     'resource' => 'Edition',
             'nom' => $name,
			 'formindex' => $form->createView()
        ]); 

        

    }
}
