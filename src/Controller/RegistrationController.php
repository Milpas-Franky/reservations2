<?php

namespace App\Controller;

use App\Entity\Users;
use App\Entity\Roles;

use App\Form\RegistrationFormType;
use App\Security\FormLoginAuthenticator;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Guard\GuardAuthenticatorHandler;
use Symfony\Contracts\Translation\TranslatorInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="app_register")
     */
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, GuardAuthenticatorHandler $guardHandler, FormLoginAuthenticator $authenticator, EntityManagerInterface $entityManager): Response
    {
        $user = new Users();
		
         $form = $this->createForm(RegistrationFormType::class, $user);
         $form->handleRequest($request);
		 
		
         if ($form->isSubmitted() && $form->isValid()) 
		 {
            // encode the plain password
            $user->setPassword(
            $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
			
            $roles= new Roles();
            $roles->setRole('ROLE_MEMBER');
            $user->addRole($roles); 
			
            $entityManager->persist($user);		
            $entityManager->persist($roles);
            $entityManager->flush();
            // do anything else you need here, like send an email
            return $this->redirectToRoute('app_form_connection');
           
        }
		
         return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
        
    }
}
