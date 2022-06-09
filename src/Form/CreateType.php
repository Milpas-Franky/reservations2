<?php

namespace App\Form;

use App\Entity\Shows;
use App\Entity\Representations;
use App\Entity\Locations;
use App\Entity\Locality;
use App\Entity\ArtistsTypes;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FormType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class CreateType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('slug', TextType::class,[ 
			  'data' => 'titre-sans-espace'])
            ->add('title', TextType::class,[ 
			  'data' => 'titre'])
            ->add('description')
            ->add('poster_url')
            ->add('bookable')
            ->add('price')
            ->add('location', EntityType::class, [
                 'class' => Locations::class,
                 'choice_label' => 'designation'])
			 ->add('save', SubmitType::class) 
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Shows::class,
        ]);
    }
}
