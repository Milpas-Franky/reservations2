<?php

namespace App\Controller;

use App\Form\ReservationType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Doctrine\Common\Collections\ArrayCollection;
use App\Entity\RepresentationsUsers;
use App\Entity\Users;
use App\Entity\Shows;
use App\Entity\Representations;

class RepresentationsUsersController extends AbstractController
{
    
	/**
     * @Route("/representations_users", name="app_representations_users")
     */
    public function index()
    {
		$numero=$this->getUser()->getId();
		$name= $this->getUser()->getUsername();
        $repository = $this->getDoctrine()->getRepository(RepresentationsUsers::class);
        $representationusers = $repository->findBy(array('users' => $numero));

        return $this->render('representations_users/index.html.twig', [
            'representationusers' => $representationusers,
			'resource' => 'Réservations  :',
			'nom' => $name,
        ]);
    }
	/**
     * @Route("/representations_users/{id}", name="representations_users_show")
     */
	 public function show($id)
    {
		$name= $this->getUser()->getUsername();
        $repository = $this->getDoctrine()->getRepository(RepresentationsUsers::class);
        $representationuser = $repository->find($id);

        return $this->render('representations_users/show.html.twig', [
            'representationuser' => $representationuser,
			'resource' => 'Réservation de :',
			'nom' => $name,
        ]);
    }
	/**
     * @Route("/representations/users/{id}", name="representations_users_reservation")
     */
	  public function reservation(Request $request, $id):response
	  {
		     
		     $name= $this->getUser()->getUsername();
		     $reservation= new RepresentationsUsers();
			 $form = $this->createForm(ReservationType::class, $reservation);
			 $form->handleRequest($request);
             
            if ($form->isSubmitted() && $form->isValid()) 
		      {
				
				$user = $this->getUser();
                $repository = $this->getDoctrine()->getRepository(Representations::class);
                $representation = $repository->find($id);
                $em = $this->getDoctrine()->getManager();
				
                $reservation->setUsers($user); 
			    $reservation->setRepresentations($representation);
				 $em->persist($reservation);             
				 $em->flush();
                return $this->redirect($this->generateUrl('app_representations_users'));
        
			  }
             return $this->render('representations_users/reservation.html.twig', [
			 'resource' => 'Reservation',
             'formindex' => $form->createView()
        ]);			  
	  }
}
