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
     * @Route("/delet/{id}", name="app_delet")
	 * @IsGranted("ROLE_ADMIN")
     */
    public function index($id)
    {
         $name= $this->getUser()->getUsername();
		$em = $this->getDoctrine()->getManager();
        $show = $this->getDoctrine()->getRepository(Shows::class);
        $show = $show->find($id);

        if (!$show) {
            throw $this->createNotFoundException(
                'There are no articles with the following id: ' . $id
            );
        }

        $em->remove($show);
        $em->flush();

        return $this->redirect($this->generateUrl('app_admin'));

    }
}
