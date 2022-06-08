<?php

namespace App\Controller;
use App\Entity\Users;
use App\Form\ModificationType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Guard\GuardAuthenticatorHandler;
use Symfony\Contracts\Translation\TranslatorInterface;

class ModifierProfilController extends AbstractController
{
	   
    /**
     * @Route("/modifier/profil", name="app_modifier_profil")
     */
    public function index(Request $request): response
    {
		     
             $user = $this->getUser();
			 $form = $this->createForm(ModificationType::class, $user);
			 $form->handleRequest($request);
			 
			 
			if ($form->isSubmitted()) 
			  { 
		       			                  
				
                 $em = $this->getDoctrine()->getManager();
                 $user = $form->getData();
				 $password=$form["password"]->getData();
				if (isset($password))
				{
				// encode the password
                $user->setPassword(password_hash($password, PASSWORD_BCRYPT));
                }
                 $em->flush();
                 return $this->redirect($this->generateUrl('app_index'));

              }
            
       		
        return $this->render('modifier_profil/index.html.twig', [
		     'resource' => 'Modification',
            
			 'formindex' => $form->createView()
        ]);
   }
}
